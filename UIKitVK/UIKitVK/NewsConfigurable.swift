// NewsConfigurable.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Конфигурация ячейки новостей
typealias NewsCell = UITableViewCell & NewsConfigurable

protocol NewsConfigurable {
    func configure(_ news: NewsItem, networkService: NetworkService, image: UIImage?)
}
