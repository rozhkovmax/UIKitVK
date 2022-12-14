// UITableView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для показа/скрытия сообщения
extension UITableView {
    // MARK: - Public Methods

    func showEmptyMessage(message: String) {
        let label = UILabel()
        label.textColor = UIColor(named: Constants.CustomColorNames.linkCustomColorName)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = message
        backgroundView = label
    }

    func hideEmptyMessage() {
        backgroundView = nil
    }
}
