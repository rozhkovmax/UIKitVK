// Session.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Singleton
final class Session {
    // MARK: - Public Properties

    static let shared = Session()
    var token = String()
    var userId = String()

    // MARK: - Private Initializers

    private init() {}
}
