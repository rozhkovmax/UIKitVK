// OtherGroupTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Ячейка других групп
final class OtherGroupTableViewCell: UITableViewCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var otherGroupAvatarImageView: UIImageView!
    @IBOutlet private var otherGroupNameLabel: UILabel!

    // MARK: - Public Methods

    func refreshOtherGroup(_ otherGroup: Group) {
        otherGroupNameLabel.text = otherGroup.groupName
        otherGroupAvatarImageView.image = UIImage(named: otherGroup.groupAvatarImageName)
    }
}
