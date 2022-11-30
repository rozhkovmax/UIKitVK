// OtherGroupTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift
import UIKit

/// Экран других групп
final class OtherGroupTableViewController: UITableViewController {
    // MARK: - Private IBOutlet

    @IBOutlet private var groupSearchBar: UISearchBar!

    // MARK: - Private Properties

    private var groupHandler: ((Group) -> ())?
    private var groups: [Group] = [] {
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
        fetchUserGroups()
    }

    // MARK: - Public Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBool {
            return searchGroups.count
        } else {
            return groups.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.Identifiers.identifierOtherGroupTableViewCellID,
            for: indexPath
        ) as? OtherGroupTableViewCell else { return UITableViewCell() }
        if searchBool {
            let group = searchGroups[indexPath.row]
            cell.configure(group)
        } else {
            let group = groups[indexPath.row]
            cell.configure(group)
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchBool {
            let group = searchGroups[indexPath.row]
            groupHandler?(group)
        } else {
            let group = groups[indexPath.row]
            groupHandler?(group)
        }
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Private Methods

    private func fetchUserGroups() {
        networkService.fetchUserGroups { [weak self] groups in
            guard let self = self else { return }
            switch groups {
            case let .success(data):
                self.groups = data
                self.tableView.reloadData()
            case let .failure(error):
                print("\(Constants.OtherConstants.error): \(error.localizedDescription)")
            }
        }
    }
}

// MARK: - UISearchBarDelegate

extension OtherGroupTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchGroups = groups
            .filter { $0.name.lowercased().prefix(searchText.count) == searchText.lowercased() }
        searchBool = true
        tableView.reloadData()
        networkService.fetchGroup(group: searchText) { [weak self] groups in
            guard let self = self else { return }
            switch groups {
            case let .success(data):
                self.searchGroups = data
            case let .failure(error):
                print("\(Constants.OtherConstants.error): \(error.localizedDescription)")
            }
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBool = false
        searchBar.text = Constants.OtherConstants.emptyString
        tableView.reloadData()
    }
}
