// Group.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

// Группы
final class Group: Object, Codable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var groupAvatar: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case groupAvatar = "photo_50"
    }
}
