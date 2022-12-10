// FriendCollectionViewController.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift
import UIKit

/// Экран галереи
final class FriendCollectionViewController: UICollectionViewController {
    // MARK: - Public Properties

    var ownerID = Int()

    // MARK: - Private Properties

    private let networkService = NetworkService()
    private var photos: [Photo] = []
    private lazy var photoCacheService = PhotoCacheService(container: self)

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        unloadingPhotosRealm()
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
        ) as? FriendCollectionViewCell,
            let url = photos[indexPath.row].sizes.first?.url else { return UICollectionViewCell() }
        cell.configure(
            photos[indexPath.row],
            networkService: networkService,
            image: photoCacheService.photo(at: indexPath, byUrl: url)
        )
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
            switch photos {
            case let .success(data):
                self.photos = data
                RealmService.save(items: data)
                self.collectionView.reloadData()
            case let .failure(error):
                print("\(Constants.OtherConstants.error): \(error.localizedDescription)")
            }
        }
    }

    private func unloadingPhotosRealm() {
        guard let friendPhotos = RealmService.get(Photo.self) else { return }
        let userID = friendPhotos.map(\.ownerID)
        if userID.contains(where: { ownerIDRealm in
            ownerIDRealm == ownerID
        }) {
            photos = friendPhotos.filter {
                $0.ownerID == ownerID
            }
            collectionView.reloadData()
        } else {
            fetchPhotos()
        }
    }
}
