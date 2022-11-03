// GroupTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран групп
final class GroupTableViewController: UITableViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let identifierGroupTableViewCellID = "GroupTableViewCell"
        static let identifierSegueOtherGroupsID = "segueOtherGroups"
    }

    // MARK: - Private Properties

    private var myGroups = [vkGroups.first].compactMap { $0 } {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Public Methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Constants.identifierSegueOtherGroupsID,
              let otherGroupTableVC = segue.destination as? OtherGroupTableViewController else { return }
        otherGroupTableVC.configure(myGroups) { [weak self] group in
            self?.myGroups.append(group)
        }
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.identifierGroupTableViewCellID,
            for: indexPath
        ) as? GroupTableViewCell else { return UITableViewCell() }
        cell.groupNameLabel.text = myGroups[indexPath.row].groupName
        cell.groupAvatarImageView.image = UIImage(named: myGroups[indexPath.row].groupAvatarImageName)
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
}
