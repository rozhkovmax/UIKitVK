// LinkPhoto.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

/// Ссылка на фото
final class LinkPhoto: Object, Codable {
    /// Ширина
    var width: Int
    /// Высота
    var height: Int
    /// Соотношение сторон
    var aspectRatio: CGFloat { CGFloat(height) / CGFloat(width) }
    /// Ссылка на фото
    @Persisted var url: String
}
