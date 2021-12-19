//
//  CourseListViewControllerPadVer.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/19.
//

import RxCocoa
import RxSwift
import SnapKit
import UIKit

class CourseListViewControllerPadVer: BaseViewController {

    private lazy var collectionView: UICollectionView = {
        $0.backgroundColor = .clear
        $0.delegate = self
        $0.dataSource = self
        $0.register(CourseCollectionViewCell.self, forCellWithReuseIdentifier: CourseCollectionViewCell.reuseIdentifier)
        $0.register(CourseHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CourseHeaderCollectionReusableView.reuseIdentifier)
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: flowLayout))
    
    private lazy var flowLayout = UICollectionViewFlowLayout()
    
    private lazy var cellModifier = CourseListCellModifier()
    
    private var dataSource: [CategoryModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private let itemCountPerRow = 2
    
    private let contentOffset: CGFloat = 40.0
    
    private let minItemWidth: CGFloat = 250.0
    
    private let minItemHeight: CGFloat = 75.0
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupBindings()
        viewDidLoadRelay.accept(())
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        flowLayout.invalidateLayout()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { maker in
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

extension CourseListViewControllerPadVer: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let parentWidth = collectionView.frame.width
        let parentHeight = collectionView.frame.height
        var itemWidth = (parentWidth - contentOffset) / CGFloat(itemCountPerRow)
        itemWidth = itemWidth > minItemWidth ? itemWidth : parentWidth
        var itemHeight = parentWidth > parentHeight ? itemWidth / 5.0 : itemWidth / 3.0
        itemHeight = itemHeight > minItemHeight ? itemHeight : minItemHeight
        return CGSize(width: itemWidth, height: itemHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 40.0)
    }
}

extension CourseListViewControllerPadVer: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CourseHeaderCollectionReusableView.reuseIdentifier, for: indexPath) as? CourseHeaderCollectionReusableView else {
                return UICollectionReusableView()
            }
            if let title = dataSource[safe: indexPath.section]?.category {
                headerView.titleLabel.text = title
            }
            return headerView
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let category = dataSource[safe: section] else { return 0 }
        return category.courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        let index = indexPath.row
        guard let courses = dataSource[safe: section]?.courses, let course = courses[safe: index] else {
            return UICollectionViewCell()
        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseCollectionViewCell.reuseIdentifier, for: indexPath) as? CourseCollectionViewCell else {
            return UICollectionViewCell()
        }
        cellModifier.modifyCollectionViewCell(cell, with: course)
        return cell
    }
}
