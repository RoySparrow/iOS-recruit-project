//
//  UIViewExtensions.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/19.
//

import SnapKit
import UIKit

extension UIView {
    
    var safeAreaTop: ConstraintItem {
        return safeAreaLayoutGuide.snp.top
    }
    
    var safeAreaBottom: ConstraintItem {
        return safeAreaLayoutGuide.snp.bottom
    }
    
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0.0
        }
    }
}
