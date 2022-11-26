// NewsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка новостей
final class NewsTableViewCell: UITableViewCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var newsTextLabel: UILabel!
    @IBOutlet private var newsImageView: UIImageView!
    @IBOutlet private var repostButton: UIButton!
    @IBOutlet private var commentButton: UIButton!
    @IBOutlet private var likeButton: UIButton!
    @IBOutlet private var viewButton: UIButton!

    // MARK: - Public Methods

    func configure(_ news: News) {
        nameLabel.attributedText = NSMutableAttributedString()
            .bold("\(news.newsUserInfo)\n")
            .normal("\(news.newsUserData)")
        avatarImageView.image = UIImage(named: news.newsUserAvatarImageName)
        newsTextLabel.text = news.newsUserText
        newsImageView.image = UIImage(named: news.newsUserPhotoImageName)
    }
}
