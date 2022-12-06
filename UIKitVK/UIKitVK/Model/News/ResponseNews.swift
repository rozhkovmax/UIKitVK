// ResponseNews.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Список новостей
struct ResponseNews: Codable {
    let news: [NewsItem]
    let friends: [User]
    let groups: [Group]

    enum CodingKeys: String, CodingKey {
        case news = "items"
        case friends = "profiles"
        case groups
    }
}
