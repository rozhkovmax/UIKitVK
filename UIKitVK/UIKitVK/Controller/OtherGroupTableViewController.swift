// OtherGroupTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран других групп
final class OtherGroupTableViewController: UITableViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let identifierOtherGroupTableViewCellID = "OtherGroupTableViewCell"
    }

    // MARK: - Public Properties

    var closureGroup: ((Group) -> ())?

    // MARK: - Private Properties

    private var otherGroups = vkGroups {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
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
            withIdentifier: Constants.identifierOtherGroupTableViewCellID,
            for: indexPath
        ) as? OtherGroupTableViewCell else { return UITableViewCell() }
        cell.otherGroupNameLabel.text = otherGroups[indexPath.row].groupName
        cell.otherGroupAvatarImageView.image = UIImage(named: otherGroups[indexPath.row].groupAvatarImageName)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let group = otherGroups[indexPath.row]
        closureGroup?(group)
        navigationController?.popViewController(animated: true)
    }
}
