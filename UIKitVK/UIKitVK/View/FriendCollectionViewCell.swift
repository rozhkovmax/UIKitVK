// FriendCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Галерея друга
final class FriendCollectionViewCell: UICollectionViewCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var friendGalleryImageView: UIImageView!

    // MARK: - Public Methods

    func configure(_ photo: Photo) {
        guard let url = URL(string: photo.sizes.first?.url ?? "") else { return }
        friendGalleryImageView.loadImage(url: url)
    }
}
