// ResponseUser.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Список пользователей
struct ResponseUser: Codable {
    let count: Int
    let users: [User]

    private enum CodingKeys: String, CodingKey {
        case count
        case users = "items"
    }
}
