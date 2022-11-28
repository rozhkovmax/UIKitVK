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

    func configure(_ group: Group) {
        groupNameLabel.text = group.name
        guard let urlGroupAvatar = group.groupAvatar else { return }
        groupAvatarImageView.loadImage(url: urlGroupAvatar)
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
        groupAvatarImageView.transform = CGAffineTransform(
            scaleX: Constants.AnimationOptions.springAnimationScaleX,
            y: Constants.AnimationOptions.springAnimationScaleY
        )
        UIView.animate(
            withDuration: Constants.AnimationOptions.springAnimationDuration,
            delay: Constants.AnimationOptions.springAnimationDelay,
            usingSpringWithDamping: Constants.AnimationOptions.springAnimationDamping,
            initialSpringVelocity: Constants.AnimationOptions.springAnimationInitialVelocity,
            options: .curveEaseOut,
            animations: {
                self.groupAvatarImageView.transform = .identity
            },
            completion: nil
        )
    }
}
