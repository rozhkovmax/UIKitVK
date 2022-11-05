// OtherGroupTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран других групп
final class OtherGroupTableViewController: UITableViewController {
    // MARK: - Public Properties

    private var closureGroup: ((Group) -> ())?
    private var otherGroups = vkGroups {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Public Methods

    func configure(_ group: [Group], completion: @escaping ((Group) -> ())) {
        otherGroups = otherGroups.filter { groups in
            !group.contains { myGroup in
                myGroup == groups
            }
        }
        closureGroup = completion
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        otherGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.Identifiers.identifierOtherGroupTableViewCellID,
            for: indexPath
        ) as? OtherGroupTableViewCell else { return UITableViewCell() }
        let group = otherGroups[indexPath.row]
        cell.refreshOtherGroup(group)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let group = otherGroups[indexPath.row]
        closureGroup?(group)
        navigationController?.popViewController(animated: true)
    }
}
