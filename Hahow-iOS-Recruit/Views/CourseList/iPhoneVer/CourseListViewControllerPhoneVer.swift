//
//  CourseListViewControllerPhoneVer.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/18.
//

import RxCocoa
import RxSwift
import SnapKit
import UIKit

/// 課程列表 iPhone 版型
class CourseListViewControllerPhoneVer: BaseViewController {

    private lazy var tableView: UITableView = {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.delegate = self
        $0.dataSource = self
        $0.register(CourseFirstTableViewCell.self, forCellReuseIdentifier: CourseFirstTableViewCell.reuseIdentifier)
        $0.register(CourseTableViewCell.self, forCellReuseIdentifier: CourseTableViewCell.reuseIdentifier)
        return $0
    }(UITableView(frame: .zero, style: .grouped))
    
    private lazy var cellModifier = CourseListCellModifier()
    
    private var dataSource: [CategoryModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let viewDidLoadRelay: PublishRelay<Void>

    private let viewModel: CourseListViewModelProtocol
    
    private let disposeBag: DisposeBag
    
    init() {
        viewDidLoadRelay = PublishRelay<Void>()
        let bindings = CourseListViewModelBindings(fetch: viewDidLoadRelay.asObservable())
        viewModel = CourseListViewModel(bindings: bindings)
        disposeBag = DisposeBag()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 鎖定直向
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    /// 一定要是 true，才會讓 supportedInterfaceOrientations 生效
    override var shouldAutorotate: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupBindings()
        viewDidLoadRelay.accept(())
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview()
            maker.top.equalTo(view.safeAreaTop)
            maker.bottom.equalTo(view.safeAreaBottom)
        }
    }
    
    private func setupBindings() {
        viewModel.models
            .drive(onNext: { [weak self] models in
                self?.dataSource = models
            }).disposed(by: disposeBag)
    }
}

extension CourseListViewControllerPhoneVer: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let title = dataSource[safe: section]?.category else { return nil }
        
        let headerView = CourseListHeaderView()
        headerView.titleLabel.text = title.localizedString
        return headerView
    }
}

extension CourseListViewControllerPhoneVer: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let category = dataSource[safe: section] else { return 0 }
        return category.courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let index = indexPath.row
        guard let courses = dataSource[safe: section]?.courses, let course = courses[safe: index] else {
            return UITableViewCell()
        }
        
        if index == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseFirstTableViewCell.reuseIdentifier, for: indexPath) as? CourseFirstTableViewCell else {
                return UITableViewCell()
            }
            cellModifier.modifyFirstTableViewCell(cell, with: course)
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseTableViewCell.reuseIdentifier, for: indexPath) as? CourseTableViewCell else {
            return UITableViewCell()
        }
        cellModifier.modifyTableViewCell(cell, with: course)
        return cell
    }
}
