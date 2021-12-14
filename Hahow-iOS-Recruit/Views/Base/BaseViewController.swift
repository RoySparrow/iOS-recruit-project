//
//  BaseViewController.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/14.
//

import SnapKit
import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupConstraints()
    }

    func setupConstraints() {}
    
    deinit {
        print("\(self) deinit.")
    }
}
