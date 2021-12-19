//
//  UIImageViewExtensions.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/19.
//

import Kingfisher
import UIKit

extension UIImageView {
    
    func setImageFromURL(_ urlStr: String, placeHolder: UIImage? = nil) {
        kf.setImage(with: URL(string: urlStr), placeholder: placeHolder)
    }
}
