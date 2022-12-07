// LinkPhoto.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

/// Ссылка на фото
final class LinkPhoto: Object, Codable {
    /// Ссылка на фото
    @Persisted var url: String
}
