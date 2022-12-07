// Group.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

/// Группа
final class Group: Object, Codable {
    /// Идентификатор группы
    @Persisted(primaryKey: true) var id: Int
    /// Название группы
    @Persisted var name: String
    /// Аватар группы
    @Persisted var groupAvatar: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case groupAvatar = "photo_50"
    }
}
