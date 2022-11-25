// OtherGroupTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран других групп
final class OtherGroupTableViewController: UITableViewController {
    // MARK: - Private IBOutlet

    @IBOutlet private var groupSearchBar: UISearchBar!

    // MARK: - Private Properties

    private var closureGroup: ((Group) -> ())?
    private var otherGroups: [Group] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    private var searchBool = false
    private lazy var searchGroups: [Group] = []
    private lazy var networkService = NetworkService()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        networkServiceOtherGroups()
    }

    // MARK: - Public Methods

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

    // MARK: - Private Methods

    private func networkServiceOtherGroups() {
        networkService.fetchUserGroups { [weak self] group in
            self?.otherGroups = group
            self?.tableView.reloadData()
        }
    }
}

// MARK: - UISearchBarDelegate

extension OtherGroupTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchGroups = otherGroups
            .filter { $0.name.lowercased().prefix(searchText.count) == searchText.lowercased() }
        searchBool = true
        tableView.reloadData()
        networkService.fetchGroup(group: searchText) { [weak self] group in
            self?.searchGroups = group
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBool = false
        searchBar.text = Constants.OtherConstants.emptyString
        tableView.reloadData()
    }
}
