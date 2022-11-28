// FriendPhotoViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран фотографий друзей
final class FriendPhotoViewController: UIViewController {
    // MARK: - Private IBOutlet

    @IBOutlet private var friendPhotoImageView: UIImageView!

    // MARK: - Public Properties

    var photos: [Photo] = []
    var currentPhotoIndex = Int()

    // MARK: - Private Properties

    private var propertyAnimator: UIViewPropertyAnimator!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        panGesture()
    }

    private func panGesture() {
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction))
        view.addGestureRecognizer(recognizer)
        guard let url = photos[currentPhotoIndex].sizes.last?.url else { return }
        friendPhotoImageView.loadImage(url: url)
    }

    @objc private func panGestureAction(_ recognizer: UIPanGestureRecognizer) {
        let scale = CGAffineTransform(
            scaleX: Constants.AnimationOptions.gestureAnimationScaleX,
            y: Constants.AnimationOptions.gestureAnimationScaleY
        )
        let translation = recognizer.translation(in: view).x
        switch recognizer.state {
        case .began:
            propertyAnimator?.startAnimation()
            propertyAnimator = UIViewPropertyAnimator(
                duration: Constants.AnimationOptions.gestureAnimationDuration,
                curve: .easeInOut,
                animations: {
                    self.friendPhotoImageView.transform = scale
                }
            )
            propertyAnimator.pauseAnimation()
        case .changed:
            propertyAnimator.fractionComplete = abs(translation / view.frame.width)
            friendPhotoImageView.transform = CGAffineTransform(
                translationX: translation,
                y: Constants.AnimationOptions.gestureAnimationTranslationY
            )
        case .ended:
            propertyAnimator.stopAnimation(true)
            if translation < Constants.OtherConstants.gestureTranslationComparison {
                if currentPhotoIndex < photos.count - Constants.OtherConstants.gestureNumberPhotoChange {
                    currentPhotoIndex += Constants.OtherConstants.gestureNumberFriendPhotoChange
                }
            } else {
                if currentPhotoIndex != Constants.OtherConstants.gestureNumberPhotoCountChange {
                    currentPhotoIndex -= Constants.OtherConstants.gestureNumberFriendPhotoChange
                }
            }
            propertyAnimator.addAnimations {
                self.friendPhotoImageView.transform = .identity
            }
            propertyAnimator?.startAnimation()
        default: return
        }
        guard let url = photos[currentPhotoIndex].sizes.last?.url else { return }
        friendPhotoImageView.loadImage(url: url)
    }
}
