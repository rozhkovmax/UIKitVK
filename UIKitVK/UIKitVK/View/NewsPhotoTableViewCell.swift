// NewsPhotoTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка фото новости
final class NewsPhotoTableViewCell: UITableViewCell, NewsConfigurable {
    // MARK: - Private IBOutlet

    @IBOutlet private var newsImageView: UIImageView!

    // MARK: - Public Methods

    func configure(_ news: NewsItem, networkService: NetworkService, image: UIImage?) {}
}
