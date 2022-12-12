// NewsFooterTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка нижнего колонтитула новости
final class NewsFooterTableViewCell: UITableViewCell, NewsConfigurable {
    // MARK: - Private IBOutlet

    @IBOutlet private var repostCountLabel: UILabel!
    @IBOutlet private var commentCountLabel: UILabel!
    @IBOutlet private var likeCountLabel: UILabel!
    @IBOutlet private var viewCountLabel: UILabel!

    // MARK: - Public Methods

    func configure(_ news: NewsItem, photoCacheService: PhotoCacheService) {
        guard let repost = news.reposts?.count else { return }
        repostCountLabel.text = String(repost)
        guard let comment = news.comments?.count else { return }
        commentCountLabel.text = String(comment)
        guard let like = news.likes?.count else { return }
        likeCountLabel.text = String(like)
        guard let view = news.views?.count else { return }
        viewCountLabel.text = String(view)
    }
}
