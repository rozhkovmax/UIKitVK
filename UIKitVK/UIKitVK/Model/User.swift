// User.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

// Ответ запроса
struct ResultUser: Decodable {
    let response: ResponseUser
}

// Cписок пользователей
struct ResponseUser: Codable {
    let count: Int
    let users: [User]

    private enum CodingKeys: String, CodingKey {
        case count
        case users = "items"
    }
}

// Пользователь
final class User: Codable {
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
