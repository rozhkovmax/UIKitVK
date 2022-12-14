// NewsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран новостей
final class NewsViewController: UIViewController {
    // MARK: - Private Enum
    
    private enum NewsCellType: Int, CaseIterable {
        case header
        case post
        case photo
        case footer
    }
    
    // MARK: - Private IBOutlet
    
    @IBOutlet private var newsTableView: UITableView!
    
    // MARK: - Private Visual Components
    
    private var refreshControl = UIRefreshControl()
    
    // MARK: - Private Properties
    
    private let networkService = NetworkService()
    private var news: [NewsItem] = []
    private var isLoading = false
    private var nextPage = String()
    private var currentInterval = 0
    private lazy var photoCacheService = PhotoCacheService(container: newsTableView)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        createRefreshControl()
        newsTableView.prefetchDataSource = self
    }
    
    private func createRefreshControl() {
        guard let colorTitle = UIColor(named: Constants.CustomColorNames.linkCustomColorName) else { return }
        let refreshControlAttributes: [NSAttributedString.Key: UIColor] =
        [.foregroundColor: colorTitle]
        refreshControl.attributedTitle = NSAttributedString(
            string: Constants.OtherConstants.refreshControlTitle,
            attributes: refreshControlAttributes
        )
        refreshControl.tintColor = colorTitle
        refreshControl.addTarget(self, action: #selector(refreshNewsAction), for: .valueChanged)
        newsTableView.addSubview(refreshControl)
    }
    
    private func fetchNews() {
        var mostFreshDate: TimeInterval?
        if let firstNews = news.first {
            mostFreshDate = Double(firstNews.date) + 1
        }
        networkService.fetchPostNews(startTime: mostFreshDate ?? 0) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                self.news = self.updateNewsTable(response: data) + self.news
                self.currentInterval = data.news.first?.date ?? 0
                self.nextPage = data.nextPage ?? Constants.OtherConstants.emptyString
                self.newsTableView.reloadData()
            case let .failure(error):
                print("\(Constants.OtherConstants.error): \(error.localizedDescription)")
            }
        }
    }
    
    private func updateNewsTable(response: ResponseNews) -> [NewsItem] {
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
        return response.news
    }
    
    @objc private func refreshNewsAction() {
        fetchNews()
        refreshControl.endRefreshing()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - Public Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if news.isEmpty {
            tableView.showEmptyMessage(message: Constants.OtherConstants.tableViewEmptyText)
        } else {
            tableView.hideEmptyMessage()
        }
        return news.count
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
        case .post:
            cellID = Constants.Identifiers.identifierNewsPostTableViewCellID
        case .photo:
            cellID = Constants.Identifiers.identifierNewsPhotoTableViewCellID
        case .footer:
            cellID = Constants.Identifiers.identifierNewsFooterTableViewCellID
        }
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellID,
            for: indexPath
        ) as? NewsCell else { return UITableViewCell() }
        cell.configure(news, photoCacheService: photoCacheService)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 2:
            let tableWidth = tableView.bounds.width
            guard let news = news[indexPath.section].attachments?.first?.photo?.sizes.last?.aspectRatio
            else { return CGFloat() }
            let cellHeight = tableWidth * news
            return cellHeight
        default:
            return UITableView.automaticDimension
        }
    }
}

// MARK: - UITableViewDataSourcePrefetching

extension NewsViewController: UITableViewDataSourcePrefetching {
    // MARK: - Public Methods
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard let maxSection = indexPaths.map(\.section).max()
        else { return }
        if maxSection > news.count - Constants.OtherConstants.tableViewRowBeforeScroll, !isLoading {
            isLoading = true
            fetchNews(startTime: Double(currentInterval), nextPage: nextPage)
        }
    }
    
    // MARK: - Private Methods
    
    private func fetchNews(startTime: TimeInterval, nextPage: String) {
        networkService.fetchPostNews(startTime: Double(currentInterval), nextPage: nextPage) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                let indexSet = IndexSet(integersIn: self.news.count ..< self.news.count + data.news.count)
                let filterNews = self.updateNewsTable(response: data)
                self.news.append(contentsOf: filterNews)
                self.currentInterval = filterNews.first?.date ?? 0
                self.newsTableView.insertSections(indexSet, with: .automatic)
                if let page = data.nextPage {
                    self.nextPage = page
                }
                self.isLoading = false
            case let .failure(error):
                print("\(Constants.OtherConstants.error): \(error.localizedDescription)")
            }
        }
    }
}
