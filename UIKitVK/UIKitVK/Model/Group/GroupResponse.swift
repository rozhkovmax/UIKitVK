// GroupResponse.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

// Список групп
struct ResponseGroup: Codable {
    let count: Int
    let groups: [Group]

    private enum CodingKeys: String, CodingKey {
        case count
        case groups = "items"
    }
}
