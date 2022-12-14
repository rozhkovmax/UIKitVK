// NewsFooterTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка нижнего колонтитула новости
final class NewsFooterTableViewCell: NewsCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var repostCountLabel: UILabel!
    @IBOutlet private var commentCountLabel: UILabel!
    @IBOutlet private var likeCountLabel: UILabel!
    @IBOutlet private var viewCountLabel: UILabel!

    // MARK: - Public Methods

    func configure(_ news: NewsItem, photoCacheService: PhotoCacheService) {
        guard let repost = news.reposts?.count,
              let comment = news.comments?.count,
              let like = news.likes?.count,
              let view = news.views?.count else { return }
        repostCountLabel.text = String(repost)
        commentCountLabel.text = String(comment)
        likeCountLabel.text = String(like)
        viewCountLabel.text = String(view)
    }
}
