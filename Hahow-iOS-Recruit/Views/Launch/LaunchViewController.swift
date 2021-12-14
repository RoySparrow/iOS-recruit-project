//
//  LaunchViewController.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/14.
//

import RxCocoa
import RxSwift
import SnapKit
import UIKit

class LaunchViewController: BaseViewController {

    private lazy var messageLabel: UILabel = {
        $0.text = "Launching..."
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private let viewDidAppearRelay: PublishRelay<Void>
    
    private let viewModel: LaunchViewModel
    
    init() {
        viewDidAppearRelay = PublishRelay<Void>()
        let bindings = LaunchViewModel.Bindings(launch: viewDidAppearRelay.asObservable())
        viewModel = LaunchViewModel(bindings: bindings)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewDidAppearRelay.accept(())
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        view.addSubview(messageLabel)
        messageLabel.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }
    }
}
