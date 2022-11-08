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

    func refreshFriend(_ friend: User) {
        friendNameLabel.text = friend.friendName
        friendAvatarImageView.image = UIImage(named: friend.friendAvatarImageName)
    }

    // MARK: - Private Methods

    private func setupUI() {
        friendCustomView.configure()
        tapGesture()
    }

    private func tapGesture() {
        friendCustomView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(friendAvatarSpringAnimationAction))
        friendCustomView.addGestureRecognizer(tapGesture)
    }

    @objc private func friendAvatarSpringAnimationAction() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.1
        animation.toValue = 1
        animation.stiffness = 50
        animation.mass = 2
        animation.duration = 3
        animation.fillMode = .forwards
        friendCustomView.layer.add(animation, forKey: nil)
    }
}
