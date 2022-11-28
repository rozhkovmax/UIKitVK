// FriendCollectionViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран галереи
final class FriendCollectionViewController: UICollectionViewController {
    // MARK: - Public Properties

    var ownerID = Int()

    // MARK: - Private Properties

    private let networkService = NetworkService()
    private var photos: [Photo] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPhotos()
    }

    // MARK: - Public Methods

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.Identifiers.identifierFriendGalleryCollectionViewCellID,
            for: indexPath
        ) as? FriendCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(photos[indexPath.row])
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == Constants.Identifiers.identifierFriendsPhotoID,
            let friendsImages = segue.destination as? FriendPhotoViewController,
            let indexPath = collectionView.indexPathsForSelectedItems?.first
        else { return }
        friendsImages.photos = photos
        friendsImages.currentPhotoIndex = indexPath.row
    }

    // MARK: - Private Methods

    private func fetchPhotos() {
        networkService.fetchPhotos(ownerID: ownerID) { [weak self] photos in
            guard let self = self else { return }
            self.photos = photos
            self.collectionView.reloadData()
        }
    }
}
