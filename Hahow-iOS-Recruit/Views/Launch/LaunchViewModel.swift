//
//  LaunchViewModel.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/14.
//

import RxCocoa
import RxSwift
import UIKit

class LaunchViewModel: LaunchViewModelProtocol {
    
    private let disposeBag = DisposeBag()
    
    required init(bindings: LaunchViewModelBindings) {
        bindings.launch
            .subscribe(onNext: { [weak self] in
                self?.launch()
            }).disposed(by: disposeBag)
    }
    
    private func launch() {
        
        // 之後可能要接 remote config 或檢查 server 狀態等等，但這不是現在的重點，直接跳轉頁面
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            
            // 視需求而定，也可以只用一個 VC 處理所有的變化，不過當 iPhone 和 iPad 的差異變多時，會比較難維護
            // 這邊是因為 iPhone 必須鎖死直屏，iPad 還要考量到分割畫面的顯示，故拆成兩個
            var vc: UIViewController
            switch UIDevice.currentType {
            case .pad:
                vc = CourseListViewControllerPadVer()
            default:
                vc = CourseListViewControllerPhoneVer()
            }
            setRootViewController(vc)
        }
    }
    
    deinit {
        print("deinit.")
    }
}
