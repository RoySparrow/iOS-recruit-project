//
//  CourseListCellModifier.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/19.
//

import Foundation

class CourseListCellModifier {
    
    func modifyFirstTableViewCell(_ cell: CourseFirstTableViewCell, with model: CourseModel) {
        cell.coverImageView.setImageFromURL(model.coverImageUrl)
        cell.titleLabel.text = model.title
        cell.teacherNameLabel.text = model.name
    }
    
    func modifyTableViewCell(_ cell: CourseTableViewCell, with model: CourseModel) {
        cell.coverImageView.setImageFromURL(model.coverImageUrl)
        cell.titleLabel.text = model.title
        cell.teacherNameLabel.text = model.name
    }
    
    func modifyCollectionViewCell(_ cell: CourseCollectionViewCell, with model: CourseModel) {
        cell.coverImageView.setImageFromURL(model.coverImageUrl)
        cell.titleLabel.text = model.title
        cell.teacherNameLabel.text = model.name
    }
    
    deinit {
        print("deinit.")
    }
}
