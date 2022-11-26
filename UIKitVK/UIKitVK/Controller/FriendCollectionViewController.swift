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
        if segue.identifier == Constants.Identifiers.identifierFriendsPhotoID {
            guard let friendsImages = segue.destination as? FriendPhotoViewController else { return }
            if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                friendsImages.friendPhotos = photos
                friendsImages.currentPhotoIndex = indexPath.row
            }
        }
    }

    // MARK: - Private Methods

    private func fetchPhotos() {
        networkService.fetchPhotos(ownerID: ownerID) { [weak self] photos in
            self?.photos = photos
            self?.collectionView.reloadData()
        }
    }
}
