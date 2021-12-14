//
//  DataLoaderProtocol.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/14.
//

import Foundation
import RxSwift

protocol DataLoaderProtocol {
    
    var models: Observable<[CategoryModel]> { get }
    
    func load()
}
