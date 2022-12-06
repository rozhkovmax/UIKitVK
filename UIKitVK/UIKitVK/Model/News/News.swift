// News.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Тип поста
enum NewsItemType: Decodable {
    case post
    case photo
}

// Содержание новости
final class NewsItem: Codable {
    var text: String
    var date: Double
    var sourceID: Int
    var avatarURL: String?
    var creatorName: String?
    var likes: Likes
    var comments: Comments
    var reposts: Reposts
    var views: Views?
    var newsType: NewsItemType?

    enum CodingKeys: String, CodingKey {
        case text
        case date
        case sourceID = "source_id"
        case avatarURL
        case creatorName
        case likes
        case comments
        case reposts
        case views
    }
}
