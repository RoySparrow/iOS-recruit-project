//
//  CourseListHeaderView.swift
//  Hahow-iOS-Recruit
//
//  Created by Roy Sparrow on 2021/12/19.
//

import SnapKit
import UIKit

class CourseListHeaderView: UIView {

    private(set) lazy var titleLabel: UILabel = {
        $0.textColor = .categoryTitle
        $0.textAlignment = .left
        $0.font = .categoryTitle
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(20.0)
            maker.top.bottom.equalToSuperview()
            maker.height.equalTo(40.0)
        }
    }
}
