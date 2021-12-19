//
//  CourseListViewModelProtocol.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/19.
//

import Foundation
import RxCocoa
import RxSwift

protocol CourseListViewModelProtocol {
    
    var models: Driver<[CategoryModel]> { get }
    
    init(bindings: CourseListViewModelBindings)
}

struct CourseListViewModelBindings {
    
    let fetch: Observable<Void>
}
