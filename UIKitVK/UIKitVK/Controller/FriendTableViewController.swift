// FriendTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран друзей
final class FriendTableViewController: UITableViewController {
    // MARK: - Private Properties

    private let networkService = NetworkService()
    private let friends = vkFriends
    private var sectionsMap: [Character: [User]] = [:]
    private var sectionNameChars: [Character] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Public Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionCount = sectionsMap[sectionNameChars[section]]?.count
        else { return Constants.OtherConstants.sectionCheck }
        return sectionCount
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        sectionsMap.count
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        sectionNameChars.compactMap { String($0) }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sectionNameChars[section])
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        tableView.backgroundColor = UIColor(named: Constants.CustomColorNames.lightGrayCustomColorName)?
            .withAlphaComponent(Constants.OtherConstants.tableViewBackgroundAlpha)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.Identifiers.identifierFriendTableViewCellID,
            for: indexPath
        ) as? FriendTableViewCell,
            let friend = sectionsMap[sectionNameChars[indexPath.section]]?[indexPath.row]
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
        guard let friendAvatar = sectionsMap[sectionNameChars[indexPath.section]]?[indexPath.row].friendAvatarImageName
        else { return }
        friendCollectionVC.friendPhotos = friendAvatar
        navigationController?.pushViewController(friendCollectionVC, animated: true)
    }

    // MARK: - Private Methods

    private func setupUI() {
        headerFriendName()
        networkServicePhotos()
    }

    private func networkServicePhotos() {
        networkService.fetchPhotos()
    }

    private func headerFriendName() {
        for friendName in friends {
            guard let firstChar = friendName.friendName.first else { return }
            if sectionsMap[firstChar] != nil {
                sectionsMap[firstChar]?.append(friendName)
            } else {
                sectionsMap[firstChar] = [friendName]
            }
        }
        sectionNameChars = Array(sectionsMap.keys).sorted()
    }
}
