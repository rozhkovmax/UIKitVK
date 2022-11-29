// User.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

// Пользователь
final class User: Object, Codable {
    @Persisted var id: Int
    @Persisted var firstName: String
    @Persisted var lastName: String
    @Persisted var friendAvatar: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case friendAvatar = "photo_100"
    }

    override static func primaryKey() -> String? {
        "id"
    }
}
