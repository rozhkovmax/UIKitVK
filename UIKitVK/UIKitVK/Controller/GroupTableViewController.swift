// GroupTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift
import UIKit

/// Экран групп
final class GroupTableViewController: UITableViewController {
    // MARK: - Private Properties

    private let networkService = NetworkService()
    private var notificationToken: NotificationToken?
    private var myGroups: Results<Group>? {
        didSet {
            tableView.reloadData()
        }
    }

    private lazy var photoCacheService = PhotoCacheService(container: self)

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        unloadingGroupsRealm()
    }

    // MARK: - Public Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myGroups?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.Identifiers.identifierGroupTableViewCellID,
            for: indexPath
        ) as? GroupTableViewCell,
            let group = myGroups?[indexPath.row] else { return UITableViewCell() }
        cell.configure(group, photoCacheService: photoCacheService)
        return cell
    }

    // MARK: - Private Methods

    private func groupNotifications(result: Results<Group>) {
        notificationToken = result.observe { [weak self] change in
            guard let self = self else { return }
            switch change {
            case .initial:
                break
            case .update:
                self.myGroups = result
                self.tableView.reloadData()
            case let .error(error):
                print("\(Constants.OtherConstants.error): \(error.localizedDescription)")
            }
        }
    }

    private func fetchUserGroups() {
        networkService.fetchOperationGroups()
    }

    private func unloadingGroupsRealm() {
        guard let groups = RealmService.get(Group.self) else { return }
        groupNotifications(result: groups)
        if !groups.isEmpty {
            myGroups = groups
        } else {
            fetchUserGroups()
        }
    }
}
