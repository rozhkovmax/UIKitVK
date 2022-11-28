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
        fetchUserGroups()
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
        cell.configure(group)
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

    private func fetchUserGroups() {
        networkService.fetchUserGroups { [weak self] groups in
            guard let self = self else { return }
            self.myGroups = groups
            self.tableView.reloadData()
        }
    }
}
