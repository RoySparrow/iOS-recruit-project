//
//  HelpfulFunctions.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/14.
//

import UIKit

// MARK: - Router

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
