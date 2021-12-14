//
//  LaunchViewController.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/14.
//

import SnapKit
import UIKit

class LaunchViewController: BaseViewController {

    private lazy var messageLabel: UILabel = {
        $0.text = "Launching..."
        $0.textColor = .black
        return $0
    }(UILabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        view.addSubview(messageLabel)
        messageLabel.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }
    }
}
