// NewsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран новостей
final class NewsViewController: UIViewController {
    // MARK: - Private Types

    private enum NewsCellType: Int, CaseIterable {
        case header
        case content
        case footer
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var newsTableView: UITableView!

    // MARK: - Private Properties

    private let networkService = NetworkService()
    private var news: [NewsItem] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNews()
    }

    // MARK: - Private Methods

    private func fetchNews() {
        networkService.fetchPostNews { [weak self] news in
            guard let self = self else { return }
            switch news {
            case let .success(data):
                self.updateNewsTable(response: data)
            case let .failure(error):
                print("\(Constants.OtherConstants.error): \(error.localizedDescription)")
            }
        }
    }

    private func updateNewsTable(response: ResponseNews) {
        response.news.forEach { item in
            if item.sourceID < 0 {
                guard let group = response.groups.filter({ group in
                    group.id == item.sourceID * -1
                }).first else { return }
                item.creatorName = group.name
                item.avatarURL = group.groupAvatar
            } else {
                guard let user = response.friends.filter({ user in
                    user.id == item.sourceID
                }).first else { return }
                item.creatorName = "\(user.firstName) \(user.lastName)"
                item.avatarURL = user.friendAvatar
            }
        }
        news = response.news
        newsTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        news.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NewsCellType.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let news = news[indexPath.section]
        guard let cellType = NewsCellType(rawValue: indexPath.row) else { return UITableViewCell() }
        var cellID = Constants.OtherConstants.emptyString
        switch cellType {
        case .header:
            cellID = Constants.Identifiers.identifierNewsHeaderTableViewCellID
        case .content:
            cellID = Constants.Identifiers.identifierNewsPostTableViewCellID
        case .footer:
            cellID = Constants.Identifiers.identifierNewsFooterTableViewCellID
        }
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellID,
            for: indexPath
        ) as? NewsCell else { return UITableViewCell() }
        cell.configure(news, networkService: networkService)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
