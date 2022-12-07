// News.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Тип поста
enum NewsItemType: Decodable {
    case post
    case photo
}

/// Содержание новости
final class NewsItem: Codable {
    /// Текст новости
    let text: String
    /// Дата новости
    let date: Int
    /// Идентификатор группы
    let sourceID: Int
    /// Фото автора
    var avatarURL: String?
    /// Имя автора
    var creatorName: String?
    /// Лайки новости
    let likes: Likes
    /// Комментарии новости
    let comments: Comments
    /// Репосты новости
    let reposts: Reposts
    /// Просмотры новости
    var views: Views?
    /// Тип поста
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
