// FriendTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран друзей
final class FriendTableViewController: UITableViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let identifierFriendTableViewCellID = "FriendTableViewCell"
    }

    // MARK: - Private Properties

    private var friends = vkFriends {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.identifierFriendTableViewCellID,
            for: indexPath
        ) as? FriendTableViewCell else { return UITableViewCell() }
        cell.friendNameLabel.text = friends[indexPath.row].friendName
        cell.friendAvatarImageView.image = UIImage(named: friends[indexPath.row].friendAvatarImageName)
        return cell
    }
}
