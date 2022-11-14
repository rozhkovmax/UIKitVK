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
        if likeButton.tag == Constants.OtherConstants.likeButtonTagOff {
            likeButton.setImage(UIImage(systemName: Constants.OtherConstants.heartImageName), for: .normal)
            likeButton.setTitle(Constants.OtherConstants.likeZero, for: .normal)
            likeButton.tag = Constants.OtherConstants.likeButtonTagOn
        } else {
            likeButton.setImage(UIImage(systemName: Constants.OtherConstants.heartFillImageName), for: .normal)
            likeButton.setTitle(Constants.OtherConstants.likeOne, for: .normal)
            likeButton.tag = Constants.OtherConstants.likeButtonTagOff
        }
    }

    // MARK: - Private Methods

    private func animateLikeButton() {
        let originalButton = likeButton.transform
        UIView.animate(
            withDuration: Constants.AnimationOptions.likeButtonAnimationDuration,
            delay: Constants.AnimationOptions.likeButtonAnimationDelay,
            options: .autoreverse,
            animations: {
                self.likeButton.transform = CGAffineTransform(
                    translationX: Constants.AnimationOptions.likeButtonAnimationTranslationX,
                    y: Constants.AnimationOptions.likeButtonAnimationTranslationY
                )
            },
            completion: { _ in
                self.likeButton.transform = originalButton
            }
        )
    }
}
