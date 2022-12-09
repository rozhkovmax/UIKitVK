// ReloadTable.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

/// Обновление данных
final class ReloadTable: Operation {
    // MARK: - Public Methods

    override func main() {
        guard let parseData = dependencies.first as? ParseData else { return }
        let tempData = parseData.outputData
        do {
            let realm = try Realm()
            guard let oldData = RealmService.get(Group.self) else { return }
            try realm.write {
                realm.delete(oldData)
                realm.add(tempData)
            }
        } catch {
            print("\(Constants.OtherConstants.error): \(error.localizedDescription)")
        }
    }
}
