// NewsPhotoTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка фото новости
final class NewsPhotoTableViewCell: UITableViewCell, NewsConfigurable {
    // MARK: - Private IBOutlet

    @IBOutlet private var newsImageView: UIImageView!

    // MARK: - Public Methods

    func configure(_ news: NewsItem) {
        guard let string = news.avatarURL,
              let url = URL(string: string) else { return }
        newsImageView.loadImage(url: url)
    }
}
