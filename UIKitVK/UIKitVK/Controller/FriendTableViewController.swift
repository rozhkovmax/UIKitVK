// FriendTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран друзей
final class FriendTableViewController: UITableViewController {
    // MARK: - Private Properties

    private let friends = vkFriends
    private var sections: [Character: [User]] = [:]
    private var sectionNameChar: [Character] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Public Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionCount = sections[sectionNameChar[section]]?.count else { return 0 }
        return sectionCount
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        sectionNameChar.compactMap { String($0) }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sectionNameChar[section])
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        tableView.backgroundColor = UIColor(named: Constants.CustomColorName.lightGrayCustomColorName)?
            .withAlphaComponent(0.95)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.Identifiers.identifierFriendTableViewCellID,
            for: indexPath
        ) as? FriendTableViewCell,
            let friend = sections[sectionNameChar[indexPath.section]]?[indexPath.row]
        else { return UITableViewCell() }
        cell.refreshFriend(friend)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: Constants.OtherConstants.storyboardName, bundle: nil)
        guard let friendCollectionVC = storyboard
            .instantiateViewController(
                withIdentifier: Constants.Identifiers
                    .identifierFriendCollectionViewControllerID
            ) as? FriendCollectionViewController else { return }
        guard let friendAvatar = sections[sectionNameChar[indexPath.section]]?[indexPath.row].friendAvatarImageName
        else { return }
        friendCollectionVC.friendPhotos = friendAvatar
        navigationController?.pushViewController(friendCollectionVC, animated: true)
    }

    // MARK: - Private Methods

    private func setupUI() {
        headerFriendName()
    }

    private func headerFriendName() {
        for friendName in friends {
            guard let firstChar = friendName.friendName.first else { return }
            if sections[firstChar] != nil {
                sections[firstChar]?.append(friendName)
            } else {
                sections[firstChar] = [friendName]
            }
        }
        sectionNameChar = Array(sections.keys).sorted()
    }
}
