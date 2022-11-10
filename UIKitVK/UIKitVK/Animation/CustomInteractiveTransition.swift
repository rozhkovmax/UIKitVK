// CustomInteractiveTransition.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Управление интерактивным закрытием
final class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
    // MARK: - Public Properties

    var hasStarted = false
    var shouldFinish = false
    var viewController: UIViewController? {
        didSet {
            let recognizer = UIScreenEdgePanGestureRecognizer(
                target: self,
                action: #selector(handleScreenEdgeGestureAction)
            )
            recognizer.edges = [.left]
            viewController?.view.addGestureRecognizer(recognizer)
        }
    }

    // MARK: - Private Methods

    @objc private func handleScreenEdgeGestureAction(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            hasStarted = true
            viewController?.navigationController?.popViewController(animated: true)
        case .changed:
            let translation = recognizer.translation(in: recognizer.view)
            let relativeTranslation = translation.x / (recognizer.view?.bounds.width ?? 1)
            let progress = max(0, min(1, relativeTranslation))
            shouldFinish = progress > 0.33
            update(progress)
        case .ended:
            hasStarted = false
            if shouldFinish {
                finish()
            } else {
                cancel()
            }
        case .cancelled:
            hasStarted = false
            cancel()
        default:
            return
        }
    }
}
