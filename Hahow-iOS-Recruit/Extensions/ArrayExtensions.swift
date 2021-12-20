//
//  ArrayExtensions.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/19.
//

import Foundation

extension Array {
    
    // 封裝判斷 index 的邏輯
    subscript (safe index: Index) -> Element? {
        return 0 <= index && index < count ? self[index] : nil
    }
}
