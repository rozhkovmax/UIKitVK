// NewsPhotoTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка фото новости
final class NewsPhotoTableViewCell: NewsCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var newsImageView: UIImageView!

    // MARK: - Public Methods

    override func prepareForReuse() {
        super.prepareForReuse()
        newsImageView.image = nil
    }

    func configure(_ news: NewsItem, photoCacheService: PhotoCacheService) {
        guard let photo = news.attachments?.first?.photo?.sizes.last?.url else { return }
        newsImageView.image = photoCacheService.photo(byUrl: photo)
    }
}
