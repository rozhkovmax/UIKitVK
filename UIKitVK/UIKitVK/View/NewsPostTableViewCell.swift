// NewsPostTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка поста новости
final class NewsPostTableViewCell: UITableViewCell, NewsConfigurable {
    // MARK: - Private IBOutlet

    @IBOutlet private var newsPostTextView: UITextView!

    // MARK: - Public Methods

    func configure(_ news: NewsItem, networkService: NetworkService, image: UIImage?) {
        newsPostTextView.text = news.text
    }
}
