// FriendCollectionViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран галереи
final class FriendCollectionViewController: UICollectionViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let identifierFriendGalleryCollectionViewCellID = "FriendGalleryCollectionViewCell"
    }

    // MARK: - Private Properties

    private var friendPhotos = vkFriendsPhotos

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        friendPhotos.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.identifierFriendGalleryCollectionViewCellID,
            for: indexPath
        ) as? FriendCollectionViewCell else { return UICollectionViewCell() }
        let photo = friendPhotos[indexPath.row]
        cell.friendGalleryImageView.image = UIImage(named: photo)
        return cell
    }
}
