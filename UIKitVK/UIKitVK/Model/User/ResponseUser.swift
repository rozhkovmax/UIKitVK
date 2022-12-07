// ResponseUser.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Список пользователей
struct ResponseUser: Codable {
    /// Пользователи
    let users: [User]

    private enum CodingKeys: String, CodingKey {
        case users = "items"
    }
}
