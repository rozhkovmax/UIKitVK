// CustomPushAnimation.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Анимация перехода
final class CustomPushAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    // MARK: - Public Methods

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        1
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else { return }
        let containerViewFrame = transitionContext.containerView.frame
        let sourceViewFrame = CGRect(
            x: -containerViewFrame.height,
            y: 0,
            width: source.view.frame.height,
            height: source.view.frame.width
        )
        let destinationViewFrame = source.view.frame
        transitionContext.containerView.addSubview(destination.view)
        destination.view.transform = CGAffineTransform(rotationAngle: -.pi / 2)
        destination.view.frame = CGRect(
            x: containerViewFrame.width,
            y: 0,
            width: source.view.frame.height,
            height: source.view.frame.width
        )
        UIView.animate(
            withDuration: 1
        ) {
            source.view.transform = CGAffineTransform(rotationAngle: .pi / 2)
            source.view.frame = sourceViewFrame
            destination.view.transform = .identity
            destination.view.frame = destinationViewFrame
        } completion: { result in
            if result, !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(result && !transitionContext.transitionWasCancelled)
        }
    }
}
