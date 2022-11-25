// Photo.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

// Ответ запроса
struct ResultPhoto: Decodable {
    let response: ResponsePhoto
}

// Список фото
struct ResponsePhoto: Codable {
    let count: Int
    let photos: [Photo]

    private enum CodingKeys: String, CodingKey {
        case count
        case photos = "items"
    }
}

// Фото
final class Photo: Codable {
    let sizes: [SizePhoto]
}

// Ссылка на фото
final class SizePhoto: Codable {
    @objc dynamic var url: String
}
