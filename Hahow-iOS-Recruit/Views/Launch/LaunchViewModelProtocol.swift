//
//  LaunchViewModelProtocol.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/19.
//

import Foundation
import RxCocoa
import RxSwift

protocol LaunchViewModelProtocol {
    
    init(bindings: LaunchViewModelBindings)
}

struct LaunchViewModelBindings {
    
    let launch: Observable<Void>
}
