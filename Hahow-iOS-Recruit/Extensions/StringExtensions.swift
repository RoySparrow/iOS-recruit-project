//
//  StringExtensions.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/20.
//

import Foundation

extension String {
    
    var localizedString: String {
        return LocalizationHelper.shared.getLocalizedString(key: self) ?? self
    }
}
