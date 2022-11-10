// FriendPhotoViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран фотографий друзей
final class FriendPhotoViewController: UIViewController {
    // MARK: - Private IBOutlet

    @IBOutlet private var friendPhotoImageView: UIImageView!

    // MARK: - Private Properties

    private let friendPhotos = Constants.FriendPhotoImage.friendPhotos
    private var numberPhoto = 0
    private var propertyAnimator: UIViewPropertyAnimator!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        panGesture()
        friendPhotoImageView.image = friendPhotos[numberPhoto]
    }

    private func panGesture() {
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction))
        view.addGestureRecognizer(recognizer)
    }

    @objc private func panGestureAction(_ recognizer: UIPanGestureRecognizer) {
        let scale = CGAffineTransform(scaleX: 2, y: 2)
        let translation = recognizer.translation(in: view).x
        switch recognizer.state {
        case .began:
            propertyAnimator?.startAnimation()
            propertyAnimator = UIViewPropertyAnimator(
                duration: 1,
                curve: .easeInOut,
                animations: {
                    self.friendPhotoImageView.transform = scale
                }
            )
            propertyAnimator.pauseAnimation()
        case .changed:
            propertyAnimator.fractionComplete = abs(translation / view.frame.width)
            friendPhotoImageView.transform = CGAffineTransform(translationX: translation, y: 0)
        case .ended:
            propertyAnimator.stopAnimation(true)
            if translation < 0 {
                if numberPhoto < friendPhotos.count - 1 {
                    numberPhoto += 1
                }
            } else {
                if numberPhoto != 0 {
                    numberPhoto -= 1
                }
            }
            propertyAnimator.addAnimations {
                self.friendPhotoImageView.transform = .identity
            }
            propertyAnimator?.startAnimation()
        default: return
        }
        friendPhotoImageView.image = friendPhotos[numberPhoto]
    }
}
