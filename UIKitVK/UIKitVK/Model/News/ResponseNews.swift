// ResponseNews.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Список новостей
struct ResponseNews: Codable {
    /// Новости
    let news: [NewsItem]
    /// Пользователи
    let friends: [User]
    /// Группы
    let groups: [Group]

    enum CodingKeys: String, CodingKey {
        case news = "items"
        case friends = "profiles"
        case groups
    }
}
