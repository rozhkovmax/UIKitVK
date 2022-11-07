// LikeButton.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кнопка лайков
final class LikeButton: UIControl {
    // MARK: - Private IBOutlet

    @IBOutlet private var likeButton: UIButton!

    // MARK: - Private IBAction

    @IBAction private func likeButtonClickAction(_ sender: UIButton) {
        if likeButton.tag == 0 {
            likeButton.setImage(UIImage(systemName: Constants.OtherConstants.heartImageName), for: .normal)
            likeButton.setTitle(Constants.OtherConstants.likeZero, for: .normal)
            likeButton.tag = 1
        } else {
            likeButton.setImage(UIImage(systemName: Constants.OtherConstants.heartFillImageName), for: .normal)
            likeButton.setTitle(Constants.OtherConstants.likeOne, for: .normal)
            likeButton.tag = 0
        }
    }
}
