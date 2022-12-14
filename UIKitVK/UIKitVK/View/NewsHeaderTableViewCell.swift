// NewsHeaderTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка заголовка новости
final class NewsHeaderTableViewCell: NewsCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!

    // MARK: - Public Methods

    func configure(_ news: NewsItem, photoCacheService: PhotoCacheService) {
        let date = DateFormatter.convert(Int(news.date))
        guard let name = news.creatorName else { return }
        nameLabel.attributedText = NSMutableAttributedString()
            .bold("\(name)\n")
            .normal("\(date)")
        guard let avatar = news.avatarURL else { return }
        avatarImageView.image = photoCacheService.photo(byUrl: avatar)
    }
}
