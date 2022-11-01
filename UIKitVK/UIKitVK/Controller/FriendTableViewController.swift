// FriendTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер представления таблицы "Друзья"
final class FriendTableViewController: UITableViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let identifierFriendTableViewCell = "FriendTableViewCell"
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UITableViewDataSource, UITableViewDelegate

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.identifierFriendTableViewCell,
            for: indexPath
        ) as? FriendTableViewCell else { return UITableViewCell() }
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
