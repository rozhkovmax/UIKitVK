// NSMutableAttributedString+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для NSMutableAttributedString
extension NSMutableAttributedString {
    var boldFont: UIFont { UIFont.boldSystemFont(ofSize: Constants.OtherConstants.boldFontSize) }
    var systemFont: UIFont { UIFont.systemFont(ofSize: Constants.OtherConstants.fontSize) }

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
