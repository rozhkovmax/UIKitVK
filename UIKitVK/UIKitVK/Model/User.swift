// User.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

// Пользователь
struct User: Decodable {
    let response: Response
}

// Первый уровень JSON
struct Response: Codable {
    let count: Int
    let friends: [Item]

    private enum CodingKeys: String, CodingKey {
        case count
        case friends = "items"
    }
}

// JSON Друзей
final class Item: Codable {
    @objc dynamic var id: Int
    @objc dynamic var firstName: String
    @objc dynamic var lastName: String
    @objc dynamic var friendAvatar: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case friendAvatar = "photo_100"
    }
}
