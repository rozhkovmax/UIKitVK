// Group.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

// Ответ запроса
struct ResultGroup: Decodable {
    let response: ResponseGroup
}

// Список групп
struct ResponseGroup: Codable {
    let count: Int
    let groups: [Group]

    private enum CodingKeys: String, CodingKey {
        case count
        case groups = "items"
    }
}

// Группы
final class Group: Codable {
    @objc dynamic var id: Int
    @objc dynamic var name: String
    @objc dynamic var groupAvatar: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case groupAvatar = "photo_50"
    }
}
