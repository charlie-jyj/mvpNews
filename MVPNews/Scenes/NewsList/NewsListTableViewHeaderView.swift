//
//  NewsListTableViewHeaderView.swift
//  MVPNews
//
//  Created by 정유진 on 2022/09/26.
//

import SnapKit
import TTGTags
import UIKit

final class NewsListTableViewHeaderView: UITableViewHeaderFooterView {
    static let identifier = "NewsListTableViewHeaderView"
    
    private lazy var tagView = TTGTextTagCollectionView()
    private var tags: [String] = ["IT", "iOS", "아이폰", "개발", "개발자", "앱개발", "스타트업", "판교"]
    
    func setup() {
        contentView.backgroundColor = .systemBackground
        setupTagCollectionViewLayout()
        setupTagCollectionView()
    }
}

private extension NewsListTableViewHeaderView {
    func setupTagCollectionViewLayout() {
        addSubview(tagView)
        tagView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupTagCollectionView() {
        tagView.numberOfLines = 1
        tagView.scrollDirection = .horizontal
        tagView.selectionLimit = 1
        tagView.showsHorizontalScrollIndicator = false
        tagView.delegate = self
        let insetValue: CGFloat = 16.0
        tagView.contentInset = UIEdgeInsets(
            top: insetValue,
            left: insetValue,
            bottom: insetValue,
            right: insetValue)
        
        let cornerRadiusValue: CGFloat = 12.0
        let shadowOpacity = 0.0
        let extraSpace = CGSize(width: 20.0, height: 12.0)
        let color: UIColor = .systemOrange
        
        let style = TTGTextTagStyle()
        style.backgroundColor = color
        style.cornerRadius = cornerRadiusValue
        style.borderWidth = 0.0
        style.shadowOpacity = shadowOpacity
        style.extraSpace = extraSpace
        
        let selectedStyle = TTGTextTagStyle()
        selectedStyle.backgroundColor = .white
        selectedStyle.cornerRadius = cornerRadiusValue
        selectedStyle.shadowOpacity = shadowOpacity
        selectedStyle.extraSpace = extraSpace
        selectedStyle.borderColor = color
        
        tags.forEach { tag in
            let uifont: UIFont = .systemFont(ofSize: 14.0, weight: .semibold)
            let tagContent = TTGTextTagStringContent(
                text: tag,
                textFont: uifont,
                textColor: .white)
            let selectedTagContents = TTGTextTagStringContent(
                text: tag,
                textFont: uifont,
                textColor: color)
            let textTag: TTGTextTag = TTGTextTag(
                content: tagContent,
                style: style,
                selectedContent: selectedTagContents,
                selectedStyle: selectedStyle)
            tagView.addTag(textTag)
        }
        
        tagView.reload()
    }
}

extension NewsListTableViewHeaderView: TTGTextTagCollectionViewDelegate {
    func textTagCollectionView(_ textTagCollectionView: TTGTextTagCollectionView!, canTap tag: TTGTextTag!, at index: UInt) -> Bool {
        true
    }
    
    func textTagCollectionView(_ textTagCollectionView: TTGTextTagCollectionView!, didTap tag: TTGTextTag!, at index: UInt) {
        guard tag.selected else { return }
        let tag = tags[Int(index)]
        print(tag)
    }
}
