//
//  BaseViewController.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/14.
//

import UIKit

/// 處理共通的 VC 設定
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .background
        setupConstraints()
    }

    func setupConstraints() {}
    
    /// 確認是否有順利釋放
    deinit {
        print("\(self) deinit.")
    }
}
