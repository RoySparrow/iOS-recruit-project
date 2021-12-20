//
//  UIDeviceExtensions.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/19.
//

import UIKit

extension UIDevice {
    
    static var currentType: UIUserInterfaceIdiom {
        return UIDevice.current.userInterfaceIdiom
    }
}
