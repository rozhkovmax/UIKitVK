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
        ) as? GroupTableViewCell else { return UITableViewCell() }
        guard let group = myGroups?[indexPath.row] else { return UITableViewCell() }
        cell.configure(group)
        return cell
    }
    
    // MARK: - Private Methods
    
    private func groupNotifications(result: Results<Group>) {
        notificationToken = result.observe { change in
            switch change {
            case .initial:
                break
            case .update:
                self.myGroups = result
                self.tableView.reloadData()
            case let .error(error):
                print(error)
            }
        }
    }
    
    private func fetchUserGroups() {
        networkService.fetchUserGroups { [weak self] groups in
            guard let self = self else { return }
            switch groups {
            case let .success(data):
                self.networkService.saveDataRealm(data)
            case let .failure(error):
                print("\(Constants.OtherConstants.error): \(error.localizedDescription)")
            }
        }
    }
    
    private func unloadingGroupsRealm() {
        do {
            let realm = try Realm()
            let groups = realm.objects(Group.self)
            groupNotifications(result: groups)
            if !groups.isEmpty {
                myGroups = groups
            }
            if myGroups != groups {
                myGroups = groups
            } else {
                fetchUserGroups()
            }
        } catch {
            print("\(Constants.OtherConstants.error): \(error.localizedDescription)")
        }
    }
}
