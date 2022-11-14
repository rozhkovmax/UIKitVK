// CustomInteractiveTransition.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Управление интерактивным закрытием
final class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
    // MARK: - Public Properties

    var isStarted = false
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

    // MARK: - Private Properties

    private var isShouldFinish = false

    // MARK: - Private Methods

    @objc private func handleScreenEdgeGestureAction(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            isStarted = true
            viewController?.navigationController?.popViewController(animated: true)
        case .changed:
            let translation = recognizer.translation(in: recognizer.view)
            let relativeTranslation = translation
                .x / (recognizer.view?.bounds.width ?? Constants.OtherConstants.sizeCheck)
            let progress = max(
                Constants.AnimationOptions.screenEdgeGestureAnimationProgressMaxX,
                min(Constants.AnimationOptions.screenEdgeGestureAnimationProgressMinX, relativeTranslation)
            )
            isShouldFinish = progress > Constants.OtherConstants.screenEdgeGestureProgressChange
            update(progress)
        case .ended:
            isStarted = false
            if isShouldFinish {
                finish()
            } else {
                cancel()
            }
        case .cancelled:
            isStarted = false
            cancel()
        default:
            return
        }
    }
}
