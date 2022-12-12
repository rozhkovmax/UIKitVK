// OtherGroupTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка других групп
final class OtherGroupTableViewCell: UITableViewCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var otherGroupAvatarImageView: UIImageView!
    @IBOutlet private var otherGroupNameLabel: UILabel!

    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: - Public Methods

    func configure(_ otherGroup: Group, photoCacheService: PhotoCacheService) {
        otherGroupNameLabel.text = otherGroup.name
        guard let avatar = otherGroup.groupAvatar else { return }
        otherGroupAvatarImageView.image = photoCacheService.photo(byUrl: avatar)
    }

    // MARK: - Private Methods

    private func setupUI() {
        tapGesture()
    }

    private func tapGesture() {
        otherGroupAvatarImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(avatarSpringAnimationAction))
        otherGroupAvatarImageView.addGestureRecognizer(tapGesture)
    }

    @objc private func avatarSpringAnimationAction() {
        otherGroupAvatarImageView.transform = CGAffineTransform(
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
                self.otherGroupAvatarImageView.transform = .identity
            },
            completion: nil
        )
    }
}
