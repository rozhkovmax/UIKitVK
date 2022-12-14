// NewsPostTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка поста новости
final class NewsPostTableViewCell: NewsCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var newsTextLabel: UILabel!

    // MARK: - Public Methods

    func configure(_ news: NewsItem, photoCacheService: PhotoCacheService) {
        newsTextLabel.text = news.text
        newsTextLabel.numberOfLines = 5
    }
}
