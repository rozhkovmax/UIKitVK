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
    /// Следующая страница
    let nextPage: String?

    enum CodingKeys: String, CodingKey {
        case news = "items"
        case friends = "profiles"
        case groups
        case nextPage = "next_from"
    }
}
