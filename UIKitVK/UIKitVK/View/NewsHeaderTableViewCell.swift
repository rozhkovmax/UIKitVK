// NewsHeaderTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка заголовка новости
final class NewsHeaderTableViewCell: UITableViewCell, NewsConfigurable {
    // MARK: - Private IBOutlet

    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!

    // MARK: - Public Methods

    func configure(_ news: NewsItem, networkService: NetworkService, image: UIImage?) {
        let date = dateFormat(dateForm: news.date)
        guard let name = news.creatorName else { return }
        nameLabel.attributedText = NSMutableAttributedString()
            .bold("\(name)\n")
            .normal("\(date)")
        avatarImageView.image = image
    }

    // MARK: - Private Methods

    private func dateFormat(dateForm: Int) -> String {
        let date = Date(timeIntervalSince1970: Double(dateForm))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
}
