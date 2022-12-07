// FriendTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка друзей
final class FriendTableViewCell: UITableViewCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var friendNameLabel: UILabel!
    @IBOutlet private var friendAvatarImageView: UIImageView!
    @IBOutlet private var friendCustomView: CustomView!

    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: - Public Methods

    func configure(_ friend: User) {
        friendNameLabel.text = "\(friend.firstName) \(friend.lastName)"
        guard let string = friend.friendAvatar,
              let url = URL(string: string) else { return }
        friendAvatarImageView.loadImage(url: url)
    }

    // MARK: - Private Methods

    private func setupUI() {
        friendCustomView.configure()
        tapGesture()
    }

    private func tapGesture() {
        friendCustomView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(avatarSpringAnimationAction))
        friendCustomView.addGestureRecognizer(tapGesture)
    }

    @objc private func avatarSpringAnimationAction() {
        let animation = CASpringAnimation(keyPath: Constants.AnimationOptions.transformScaleAnimationName)
        animation.fromValue = Constants.AnimationOptions.springAnimationFromValue
        animation.toValue = Constants.AnimationOptions.springAnimationToValue
        animation.stiffness = Constants.AnimationOptions.springAnimationStiffness
        animation.mass = Constants.AnimationOptions.springAnimationMass
        animation.duration = Constants.AnimationOptions.springAnimationDuration
        animation.fillMode = .forwards
        friendCustomView.layer.add(animation, forKey: nil)
    }
}
