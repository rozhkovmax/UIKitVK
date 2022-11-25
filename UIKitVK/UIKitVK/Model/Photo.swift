// Photo.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

// Фото
struct Photo: Decodable {
    let response: ResponsePhoto
}

// Первый уровень JSON
struct ResponsePhoto: Codable {
    let count: Int
    let photos: [AllPhoto]

    private enum CodingKeys: String, CodingKey {
        case count
        case photos = "items"
    }
}

// Второй уровень JSON
struct AllPhoto: Codable {
    let sizes: [SizePhoto]
}

// JSON Фоток
final class SizePhoto: Codable {
    @objc dynamic var url: String
}
