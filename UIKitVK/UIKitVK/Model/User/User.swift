// User.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

/// Пользователь
final class User: Object, Codable {
    /// Идентификатор пользователя
    @Persisted(primaryKey: true) var id: Int
    /// Имя пользователя
    @Persisted var firstName: String
    /// Фамилия пользователя
    @Persisted var lastName: String
    /// Аватар пользоваетля
    @Persisted var friendAvatar: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case friendAvatar = "photo_100"
    }
}
