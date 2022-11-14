// CustomView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Кастомная вью
@IBDesignable final class CustomView: UIView {
    // MARK: - Public Properties

    override class var layerClass: AnyClass {
        CAShapeLayer.self
    }

    // MARK: - Private Properties

    @IBInspectable private var borderColor: UIColor = .white {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable private var shadowColor: UIColor = .white {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable private var borderWidth: CGFloat = Constants.OtherConstants.customViewBorderWidthInitialValue {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable private var shadowOpacity: CGFloat = Constants.OtherConstants.customViewShadowOpacityInitialValue {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable private var shadowRadius: CGFloat = Constants.OtherConstants.customViewShadowRadiusInitialValue {
        didSet {
            setNeedsDisplay()
        }
    }

    // MARK: - Public Methods

    func configure() {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.cornerRadius = Constants.OtherConstants.customViewCornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = Float(shadowOpacity)
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = .zero
    }
}
