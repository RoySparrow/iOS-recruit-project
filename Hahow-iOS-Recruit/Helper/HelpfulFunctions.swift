//
//  HelpfulFunctions.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/14.
//

import UIKit

// 這邊存放一些共用的方法，如果有複雜的處理邏輯，且方法間彼此有關聯，也可以拉成獨立的 class

// MARK: - Router

// 如果跳轉頁面有十分複雜的邏輯，可以拉成獨立的 Router class，不過在這個題目上還不需要
func setRootViewController(_ viewController: UIViewController) {
    let keyWindow = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first
    keyWindow?.rootViewController = viewController
}

// MARK: - Other

func print<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    Swift.print("[\(fileName)(\(line)), \(method)] \(message)")
    #endif
}
