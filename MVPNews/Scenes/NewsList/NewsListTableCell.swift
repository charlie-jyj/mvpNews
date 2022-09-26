//
//  NewsListTableCell.swift
//  MVPNews
//
//  Created by 정유진 on 2022/09/23.
//

import Foundation
import UIKit
import SnapKit

final class NewsListTableCell: UITableViewCell {
    static let identifier = "NewsListTableCell"
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .semibold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    func setup() {
        setupLayout()
        accessoryType = .detailDisclosureButton
        selectionStyle = .none
        titleLabel.text = "제목"
        descriptionLabel.text = "내용"
        dateLabel.text = "2022.09.26"
    }
}

private extension NewsListTableCell {
    func setupLayout() {
        [
            titleLabel,
            descriptionLabel,
            dateLabel
        ]
            .forEach {
                addSubview($0)
            }
        
        let superViewInset: CGFloat = 16.0
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(superViewInset)
            $0.trailing.equalToSuperview().inset(48.0)
            $0.top.equalToSuperview().inset(superViewInset)
        }
        
        let verticalSpacing: CGFloat = 4.0
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.top.equalTo(titleLabel.snp.bottom).offset(verticalSpacing)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.top.equalTo(titleLabel.snp.bottom).offset(verticalSpacing)
        }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(verticalSpacing)
            $0.bottom.equalToSuperview().inset(superViewInset)
        }
    }
}
