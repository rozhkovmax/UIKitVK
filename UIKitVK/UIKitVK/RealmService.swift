// RealmService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

/// Сервис для сохранения, чтения данных
final class RealmService {
    // MARK: - Public Properties

    static let defaultRealmService = RealmService()

    // MARK: - Public Methods

    func save<T: Object>(_ object: [T]) {
        do {
            let configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            let realm = try Realm(configuration: configuration)
            try realm.write {
                realm.add(object, update: .modified)
            }
        } catch {
            print("\(Constants.OtherConstants.error): \(error.localizedDescription)")
        }
    }

    func get<T: Object>(type: T.Type) -> Results<T>? {
        var items: Results<T>?
        do {
            let realm = try Realm()
            items = realm.objects(T.self)
        } catch {
            print("\(Constants.OtherConstants.error): \(error.localizedDescription)")
        }
        return items
    }
}
