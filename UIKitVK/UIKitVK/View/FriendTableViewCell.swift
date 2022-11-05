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
    }
}
