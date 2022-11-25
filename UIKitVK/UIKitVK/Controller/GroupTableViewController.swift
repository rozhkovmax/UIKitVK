// GroupTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран групп
final class GroupTableViewController: UITableViewController {
    // MARK: - Private Properties

    private let networkService = NetworkService()
    private var myGroups: [Group] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        networkServiceUserGroups()
    }

    // MARK: - Public Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.Identifiers.identifierGroupTableViewCellID,
            for: indexPath
        ) as? GroupTableViewCell else { return UITableViewCell() }
        let group = myGroups[indexPath.row]
        cell.refreshGroup(group)
        return cell
    }

    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            myGroups.remove(at: indexPath.row)
        }
    }

    // MARK: - Private Methods

    private func networkServiceUserGroups() {
        networkService.fetchUserGroups { [weak self] group in
            self?.myGroups = group
            self?.tableView.reloadData()
        }
    }
}
