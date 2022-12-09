// ParseData.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Парсинг данных
final class ParseData: Operation {
    // MARK: - Public Properties

    var itemGroups: [Group] = []

    // MARK: - Public Methods

    override func main() {
        guard let getDataOperation = dependencies.first as? GetDataOperation,
              let data = getDataOperation.data else { return }
        do {
            let result = try JSONDecoder().decode(ResultGroup.self, from: data)
            itemGroups = result.response.groups
        } catch {
            print("\(Constants.OtherConstants.error): \(error.localizedDescription)")
        }
    }
}
