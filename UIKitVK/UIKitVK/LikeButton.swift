// LikeButton.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кнопка лайков
final class LikeButton: UIControl {
    // MARK: - Private Constants

    private enum Constants {
        static let likeZero = "0"
        static let likeOne = "1"
        static let heartImageName = "heart"
        static let heartFillImageName = "heart.fill"
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var likeButton: UIButton!

    // MARK: - Private IBAction

    @IBAction private func likeButtonClick(_ sender: UIButton) {
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
