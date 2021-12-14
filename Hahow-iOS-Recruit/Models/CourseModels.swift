//
//  CourseModels.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/14.
//

import Foundation

struct AllJSONModel: Codable {
    
    var data: [CategoryModel] = []
}

struct CategoryModel: Codable {
    
    var category = ""
    
    var courses: [CourseModel] = []
}

struct CourseModel: Codable {
    
    var title = ""
    
    var coverImageUrl = ""
    
    var name = ""
    
    var category = ""
}
