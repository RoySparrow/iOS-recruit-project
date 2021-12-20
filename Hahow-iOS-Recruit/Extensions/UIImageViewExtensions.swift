//
//  UIImageViewExtensions.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/19.
//

import Kingfisher
import UIKit

// 將 Kingfisher 封裝在 extension 裡，而不是直接在 VC 使用，如果之後要換套件會比較好改
extension UIImageView {
    
    func setImageFromURL(_ urlStr: String, placeHolder: UIImage? = nil) {
        kf.setImage(with: URL(string: urlStr), placeholder: placeHolder)
    }
}
