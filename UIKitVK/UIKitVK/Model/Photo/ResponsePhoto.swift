// ResponsePhoto.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Список фото
struct ResponsePhoto: Codable {
    /// Фотографии
    let photos: [Photo]

    private enum CodingKeys: String, CodingKey {
        case photos = "items"
    }
}
