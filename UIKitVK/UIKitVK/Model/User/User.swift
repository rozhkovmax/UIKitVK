// User.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

// Пользователь
final class User: Object, Codable {
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
