// Group.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

// Группы
final class Group: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var name: String
    @objc dynamic var groupAvatar: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case groupAvatar = "photo_50"
    }
}
