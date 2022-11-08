// OtherGroupTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Ячейка других групп
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

    func refreshOtherGroup(_ otherGroup: Group) {
        otherGroupNameLabel.text = otherGroup.groupName
        otherGroupAvatarImageView.image = UIImage(named: otherGroup.groupAvatarImageName)
    }

    // MARK: - Private Methods

    private func setupUI() {
        tapGesture()
    }

    private func tapGesture() {
        otherGroupAvatarImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(otherGroupAvatarSpringAnimationAction))
        otherGroupAvatarImageView.addGestureRecognizer(tapGesture)
    }

    @objc private func otherGroupAvatarSpringAnimationAction() {
        otherGroupAvatarImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(
            withDuration: 3.0,
            delay: 0.0,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.5,
            options: .curveEaseOut,
            animations: {
                self.otherGroupAvatarImageView.transform = .identity
            },
            completion: nil
        )
    }
}
