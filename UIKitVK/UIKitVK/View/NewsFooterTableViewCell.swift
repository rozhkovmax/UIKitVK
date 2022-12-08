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

    func configure(_ news: NewsItem, networkService: NetworkService) {
        repostCountLabel.text = String(news.reposts.count)
        commentCountLabel.text = String(news.comments.count)
        likeCountLabel.text = String(news.likes.count)
        guard let view = news.views?.count else { return }
        viewCountLabel.text = String(view)
    }
}
