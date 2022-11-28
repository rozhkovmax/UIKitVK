// ResponsePhoto.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Список фото
struct ResponsePhoto: Codable {
    let count: Int
    let photos: [Photo]

    private enum CodingKeys: String, CodingKey {
        case count
        case photos = "items"
    }
}
