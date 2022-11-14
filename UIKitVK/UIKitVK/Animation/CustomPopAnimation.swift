// CustomPopAnimation.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Анимация возврата
final class CustomPopAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    // MARK: - Public Methods

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        Constants.AnimationOptions.popAnimationDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else { return }
        let containerViewFrame = transitionContext.containerView.frame
        let sourceViewFrame = CGRect(
            x: containerViewFrame.width,
            y: Constants.OtherConstants.popSourceViewControllerPositionY,
            width: source.view.frame.height,
            height: source.view.frame.width
        )
        let destinationViewFrame = source.view.frame
        transitionContext.containerView.addSubview(destination.view)
        destination.view
            .transform = CGAffineTransform(
                rotationAngle: Constants.AnimationOptions
                    .popAnimationDestinationRotationAngle
            )
        destination.view.frame = CGRect(
            x: -containerViewFrame.height,
            y: Constants.OtherConstants.popDestinationViewControllerPositionY,
            width: source.view.frame.height,
            height: source.view.frame.width
        )
        UIView.animate(
            withDuration: Constants.AnimationOptions.popAnimationDuration
        ) {
            source.view
                .transform = CGAffineTransform(
                    rotationAngle: Constants.AnimationOptions
                        .popAnimationSourceRotationAngle
                )
            source.view.frame = sourceViewFrame
            destination.view.transform = .identity
            destination.view.frame = destinationViewFrame
        } completion: { result in
            if result, !transitionContext.transitionWasCancelled {
                source.removeFromParent()
            } else if transitionContext.transitionWasCancelled {
                destination.view.transform = .identity
            }
            transitionContext.completeTransition(result && !transitionContext.transitionWasCancelled)
        }
    }
}
