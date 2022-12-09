// FriendCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Галерея друга
final class FriendCollectionViewCell: UICollectionViewCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var friendGalleryImageView: UIImageView!

    // MARK: - Public Methods

    func configure(_ photo: Photo, networkService: NetworkService) {
        guard let photo = photo.sizes.first?.url else { return }
        friendGalleryImageView.loadImage(photo, networkService: networkService)
    }
}
