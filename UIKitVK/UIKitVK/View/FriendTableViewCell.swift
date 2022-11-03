// FriendTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка друзей
final class FriendTableViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet var friendNameLabel: UILabel!
    @IBOutlet var friendAvatarImageView: UIImageView!
    @IBOutlet private var friendCustomView: CustomView!

    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        friendCustomView.configure()
    }
}
