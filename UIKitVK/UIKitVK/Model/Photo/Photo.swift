// Photo.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

// Фото
final class Photo: Object, Codable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var ownerID: Int
    @Persisted var sizes = List<LinkPhoto>()

    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case sizes
    }
}
