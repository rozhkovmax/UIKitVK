// NewsPhotoTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка фото новости
final class NewsPhotoTableViewCell: UITableViewCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var newsImageView: UIImageView!

    // MARK: - Public Methods

    func configure(_ news: NewsItem) {
        guard let photoURL = news.avatarURL else { return }
        newsImageView.loadImage(url: photoURL)
    }
}
