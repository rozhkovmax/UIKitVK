// GroupResponse.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Список групп
struct ResponseGroup: Codable {
    /// Группы
    let groups: [Group]

    private enum CodingKeys: String, CodingKey {
        case groups = "items"
    }
}
