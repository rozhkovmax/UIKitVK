// NewsPostTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка поста новости
final class NewsPostTableViewCell: NewsCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var newsPostTextView: UITextView!

    // MARK: - Public Methods

    func configure(_ news: NewsItem, photoCacheService: PhotoCacheService) {
        newsPostTextView.text = news.text
    }
}
