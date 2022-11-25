// Group.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

// Группа
struct Group: Decodable {
    let response: ResponseGroup
}

// Первый уровень JSON
struct ResponseGroup: Codable {
    let count: Int
    let groups: [AllGroup]

    private enum CodingKeys: String, CodingKey {
        case count
        case groups = "items"
    }
}

// JSON Групп
final class AllGroup: Codable {
    @objc dynamic var id: Int
    @objc dynamic var name: String
    @objc dynamic var groupAvatar: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case groupAvatar = "photo_50"
    }
}
