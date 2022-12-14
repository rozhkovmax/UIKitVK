// DateFormatter+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Расширение DateFormatter для преобразования даты
extension DateFormatter {
    // MARK: - Public Methods

    static func convert(_ value: Int) -> String {
        let inputValue = TimeInterval(value)
        let date = Date(timeIntervalSince1970: inputValue)
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.OtherConstants.dateFormat
        return formatter.string(from: date)
    }
}
