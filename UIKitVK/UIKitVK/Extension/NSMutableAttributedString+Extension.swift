// NSMutableAttributedString+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для NSMutableAttributedString
extension NSMutableAttributedString {
    // MARK: - Private Properties

    private var boldFont: UIFont { UIFont.boldSystemFont(ofSize: Constants.OtherConstants.boldFontSize) }
    private var systemFont: UIFont { UIFont.systemFont(ofSize: Constants.OtherConstants.fontSize) }

    // MARK: - Public Methods

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
            .foregroundColor: UIColor.lightGray
        ]
        append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
}
