// RealmService.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Сервис для сохранения, чтения данных
final class RealmService {
    // MARK: - Public Properties

    static let deleteIfMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)

    // MARK: - Public Methods

    static func save<T: Object>(
        items: [T],
        config: Realm.Configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true),
        update: Bool = true
    ) {
        do {
            let realm = try Realm(configuration: deleteIfMigration)
            try realm.write {
                realm.add(items, update: .modified)
            }
        } catch {
            print("\(Constants.OtherConstants.error): \(error.localizedDescription)")
        }
    }

    static func get<T: Object>(
        _ type: T.Type,
        config: Realm.Configuration = Realm.Configuration.defaultConfiguration
    ) -> Results<T>? {
        do {
            let realm = try Realm(configuration: deleteIfMigration)
            return realm.objects(type)
        } catch {
            print("\(Constants.OtherConstants.error): \(error.localizedDescription)")
        }
        return nil
    }
}
