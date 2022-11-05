// GroupTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка групп
final class GroupTableViewCell: UITableViewCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var groupNameLabel: UILabel!
    @IBOutlet private var groupAvatarImageView: UIImageView!

    // MARK: - Public Methods

    func refreshGroup(_ group: Group) {
        groupNameLabel.text = group.groupName
        groupAvatarImageView.image = UIImage(named: group.groupAvatarImageName)
    }
}
