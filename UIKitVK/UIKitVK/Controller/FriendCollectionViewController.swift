// FriendCollectionViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран галереи
final class FriendCollectionViewController: UICollectionViewController {
    // MARK: - Public Properties

    var ownerID = Int()

    // MARK: - Private Properties

    private let networkService = NetworkService()
    private var photos: [AllPhoto] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        networkServicePhotos()
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
        cell.refreshPhoto(photos[indexPath.row])
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Identifiers.identifierFriendsPhotoID {
            guard let friendsImages = segue.destination as? FriendPhotoViewController else { return }
            if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                friendsImages.friendPhotos = photos
                friendsImages.numberPhoto = indexPath.row
            }
        }
    }

    // MARK: - Private Methods

    private func networkServicePhotos() {
        networkService.fetchPhotos(ownerID: ownerID) { [weak self] photos in
            self?.photos = photos
            self?.collectionView.reloadData()
        }
    }
}
