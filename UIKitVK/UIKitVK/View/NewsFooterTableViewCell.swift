// NewsFooterTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка нижнего колонтитула новости
final class NewsFooterTableViewCell: UITableViewCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var repostLabel: UILabel!
    @IBOutlet private var commentLabel: UILabel!
    @IBOutlet private var likeLabel: UILabel!
    @IBOutlet private var viewLabel: UILabel!

    // MARK: - Public Methods

    func configure(_ news: NewsItem) {
        repostLabel.text = String(news.reposts.count)
        commentLabel.text = String(news.comments.count)
        likeLabel.text = String(news.likes.count)
        guard let view = news.views?.count else { return }
        viewLabel.text = String(view)
    }
}
