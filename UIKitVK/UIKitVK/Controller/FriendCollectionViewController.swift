// FriendCollectionViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран галереи
final class FriendCollectionViewController: UICollectionViewController {
    // MARK: - Public Properties

    var friendPhotos = ""

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.Identifiers.identifierFriendGalleryCollectionViewCellID,
            for: indexPath
        ) as? FriendCollectionViewCell else { return UICollectionViewCell() }
        cell.refreshPhoto(friendPhotos)
        return cell
    }
}
