//
//  LaunchViewModel.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/14.
//

import RxCocoa
import RxSwift
import UIKit

class LaunchViewModel {
    
    struct Bindings {
        let launch: Observable<Void>
    }
    
    private let disposeBag = DisposeBag()
    
    init(bindings: Bindings) {
        bindings.launch
            .subscribe(onNext: { [weak self] in
                self?.launch()
            }).disposed(by: disposeBag)
    }
    
    private func launch() {
        
        // 之後可能要接 remote config 或檢查 server 狀態等等，但這不是現在的重點，先跳轉頁面。
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let vc = UIDevice.currentType == .phone ? CourseListViewControllerPhoneVer() : CourseListViewControllerPadVer()
            setRootViewController(vc)
        }
    }
    
    deinit {
        print("deinit.")
    }
}
