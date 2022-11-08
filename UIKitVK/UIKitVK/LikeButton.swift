// LikeButton.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кнопка лайков
final class LikeButton: UIControl {
    // MARK: - Private IBOutlet

    @IBOutlet private var likeButton: UIButton!

    // MARK: - Private IBAction

    @IBAction private func likeButtonClickAction(_ sender: UIButton) {
        animateLikeButton()
        if likeButton.tag == 1 {
            likeButton.setImage(UIImage(systemName: Constants.OtherConstants.heartImageName), for: .normal)
            likeButton.setTitle(Constants.OtherConstants.likeZero, for: .normal)
            likeButton.tag = 0
        } else {
            likeButton.setImage(UIImage(systemName: Constants.OtherConstants.heartFillImageName), for: .normal)
            likeButton.setTitle(Constants.OtherConstants.likeOne, for: .normal)
            likeButton.tag = 1
        }
    }

    // MARK: - Private Methods

    private func animateLikeButton() {
        let originalButton = likeButton.transform
        UIView.animate(withDuration: 0.3, delay: 0, options: .autoreverse, animations: {
            self.likeButton.transform = CGAffineTransform(translationX: 0, y: 50)
        }, completion: { _ in
            self.likeButton.transform = originalButton
        })
    }
}
