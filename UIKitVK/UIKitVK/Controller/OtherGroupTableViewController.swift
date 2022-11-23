// OtherGroupTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран других групп
final class OtherGroupTableViewController: UITableViewController {
    // MARK: - Private IBOutlet

    @IBOutlet private var groupSearchBar: UISearchBar!

    // MARK: - Private Properties

    private var closureGroup: ((Group) -> ())?
    private var otherGroups = vkGroups {
        didSet {
            tableView.reloadData()
        }
    }

    private var searchBool = false
    private lazy var searchGroups: [Group] = []
    private lazy var networkService = NetworkService()

    // MARK: - Public Methods

    func configure(_ group: [Group], completion: @escaping ((Group) -> ())) {
        otherGroups = otherGroups.filter { groups in
            !group.contains { myGroup in
                myGroup == groups
            }
        }
        closureGroup = completion
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBool {
            return searchGroups.count
        } else {
            return otherGroups.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.Identifiers.identifierOtherGroupTableViewCellID,
            for: indexPath
        ) as? OtherGroupTableViewCell else { return UITableViewCell() }
        if searchBool {
            let group = searchGroups[indexPath.row]
            cell.refreshOtherGroup(group)
        } else {
            let group = otherGroups[indexPath.row]
            cell.refreshOtherGroup(group)
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchBool {
            let group = searchGroups[indexPath.row]
            closureGroup?(group)
        } else {
            let group = otherGroups[indexPath.row]
            closureGroup?(group)
        }
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UISearchBarDelegate

extension OtherGroupTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchGroups = otherGroups
            .filter { $0.groupName.lowercased().prefix(searchText.count) == searchText.lowercased() }
        searchBool = true
        tableView.reloadData()
        networkService.fetchGroup(group: searchText)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBool = false
        searchBar.text = Constants.OtherConstants.emptyString
        tableView.reloadData()
    }
}
