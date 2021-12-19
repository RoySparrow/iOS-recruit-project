//
//  CourseTableViewCell.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/19.
//

import SnapKit
import UIKit

class CourseTableViewCell: UITableViewCell {

    private(set) lazy var coverImageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.cornerRadius = 10.0
        return $0
    }(UIImageView())

    private(set) lazy var titleLabel: UILabel = {
        $0.textColor = .courseTitle
        $0.textAlignment = .left
        $0.font = .courseTitle
        $0.numberOfLines = 2
        return $0
    }(UILabel())
    
    private(set) lazy var teacherNameLabel: UILabel = {
        $0.textColor = .teacherName
        $0.textAlignment = .left
        $0.font = .teacherName
        $0.numberOfLines = 1
        return $0
    }(UILabel())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(coverImageView)
        coverImageView.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(20.0)
            maker.top.bottom.equalToSuperview().inset(10.0)
            maker.width.equalTo(125.0)
            maker.height.equalTo(75.0)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.left.equalTo(coverImageView.snp.right).offset(10.0)
            maker.top.equalTo(coverImageView)
            maker.right.equalToSuperview().inset(20.0)
        }
        
        addSubview(teacherNameLabel)
        teacherNameLabel.snp.makeConstraints { maker in
            maker.left.right.equalTo(titleLabel)
            maker.top.equalTo(titleLabel.snp.bottom)
        }
    }
}
