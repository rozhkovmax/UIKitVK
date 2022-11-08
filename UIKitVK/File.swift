// File.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// MARK: - Расширение для NSMutableAttributedString

extension NSMutableAttributedString {
    var boldFont: UIFont { UIFont.boldSystemFont(ofSize: 14) }
    var systemFont: UIFont { UIFont.systemFont(ofSize: 14) }

    func bold(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: boldFont
        ]
        append(NSAttributedString(string: value, attributes: attributes))
        return self
    }

    func normal(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: systemFont,
        ]
        append(NSAttributedString(string: value, attributes: attributes))
        return self
    }

    func textColor(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: systemFont,
            .foregroundColor: UIColor.lightGray,
        ]
        append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
}
