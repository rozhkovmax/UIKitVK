// Photo.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

/// Фото
final class Photo: Object, Codable {
    /// Идентификатор фото
    @Persisted(primaryKey: true) var id: Int
    /// Идентификатор пользователя
    @Persisted var ownerID: Int
    /// Ссылка на фотографии
    @Persisted var sizes = List<LinkPhoto>()

    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case sizes
    }
}
