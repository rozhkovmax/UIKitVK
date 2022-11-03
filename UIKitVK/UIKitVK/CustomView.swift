// CustomView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кастомная вью
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

    @IBInspectable private var borderWidth: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable private var shadowOpacity: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable private var shadowRadius: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }

    // MARK: - Public Methods

    func configure() {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.cornerRadius = 40
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = Float(shadowOpacity)
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = .zero
    }
}
