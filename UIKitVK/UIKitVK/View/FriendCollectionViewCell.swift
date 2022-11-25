// FriendCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Галерея друга
final class FriendCollectionViewCell: UICollectionViewCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var friendGalleryImageView: UIImageView!

    // MARK: - Public Methods

    func refreshPhoto(_ photo: AllPhoto) {
        guard let urlPhoto = photo.sizes.first?.url else { return }
        friendGalleryImageView.loadAvatar(url: urlPhoto)
    }
}
