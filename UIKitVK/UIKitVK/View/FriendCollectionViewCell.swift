// FriendCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Галерея друга
final class FriendCollectionViewCell: UICollectionViewCell {
    // MARK: - Private Constants

    private enum Constants {
        static let likeZero = "0"
        static let likeOne = "1"
        static let heartImageName = "heart"
        static let heartFillImageName = "heart.fill"
    }

    // MARK: - IBOutlet

    @IBOutlet var friendGalleryImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!

    // MARK: - IBAction

    @IBAction func likeButtonClick(_ sender: UIButton) {
        if likeButton.tag == 0 {
            likeButton.setImage(UIImage(systemName: Constants.heartImageName), for: .normal)
            likeButton.setTitle(Constants.likeZero, for: .normal)
            likeButton.tag = 1
        } else {
            likeButton.setImage(UIImage(systemName: Constants.heartFillImageName), for: .normal)
            likeButton.setTitle(Constants.likeOne, for: .normal)
            likeButton.tag = 0
        }
    }
}
