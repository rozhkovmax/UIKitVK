// NewsHeaderTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка заголовка новости
final class NewsHeaderTableViewCell: UITableViewCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!

    // MARK: - Public Methods

    func configure(_ news: NewsItem) {
        let date = dateFormat(dateForm: news.date)
        guard let name = news.creatorName else { return }
        nameLabel.attributedText = NSMutableAttributedString()
            .bold("\(name)\n")
            .normal("\(date)")
        guard let avatarURL = news.avatarURL else { return }
        avatarImageView.loadImage(url: avatarURL)
    }

    // MARK: - Private Methods

    private func dateFormat(dateForm: Double) -> String {
        let date = Date(timeIntervalSince1970: dateForm)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
}
