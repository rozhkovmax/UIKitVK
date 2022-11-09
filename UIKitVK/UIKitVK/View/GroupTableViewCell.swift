// GroupTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка групп
final class GroupTableViewCell: UITableViewCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var groupNameLabel: UILabel!
    @IBOutlet private var groupAvatarImageView: UIImageView!

    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: - Public Methods

    func refreshGroup(_ group: Group) {
        groupNameLabel.text = group.groupName
        groupAvatarImageView.image = UIImage(named: group.groupAvatarImageName)
    }

    // MARK: - Private Methods

    private func setupUI() {
        tapGesture()
    }

    private func tapGesture() {
        groupAvatarImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(groupAvatarSpringAnimationAction))
        groupAvatarImageView.addGestureRecognizer(tapGesture)
    }

    @objc private func groupAvatarSpringAnimationAction() {
        groupAvatarImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(
            withDuration: 3.0,
            delay: 0.0,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.5,
            options: .curveEaseOut,
            animations: {
                self.groupAvatarImageView.transform = .identity
            },
            completion: nil
        )
    }
}
