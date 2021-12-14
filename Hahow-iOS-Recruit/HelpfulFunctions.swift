//
//  HelpfulFunctions.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/14.
//

import Foundation

func print<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    Swift.print("[\(fileName)(\(line)), \(method)] \(message)")
    #endif
}
