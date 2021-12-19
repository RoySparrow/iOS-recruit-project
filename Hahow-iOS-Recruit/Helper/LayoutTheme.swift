//
//  LayoutTheme.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/19.
//

import UIKit

// 將所有的顏色、字型等資源統一管理，如果有更換整支 app 風格的需求，會比較好改

extension UIColor {
    
    static let categoryTitle: UIColor = .black
    
    static let courseTitle: UIColor = .black
    
    static let teacherName: UIColor = .gray
}

extension UIFont {
    
    static let categoryTitle: UIFont = .systemFont(ofSize: 30.0, weight: .bold)
    
    static let courseTitle: UIFont = .systemFont(ofSize: 20.0, weight: .semibold)
    
    static let teacherName: UIFont = .systemFont(ofSize: 12.0, weight: .regular)
}
