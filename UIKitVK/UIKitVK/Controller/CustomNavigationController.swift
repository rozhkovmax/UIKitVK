// CustomNavigationController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кастомный NavigationController
final class CustomNavigationController: UINavigationController {
    // MARK: - Private Properties

    private let interactiveTransition = CustomInteractiveTransition()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        delegate = self
    }
}

// MARK: - UIViewControllerTransitioningDelegate

extension CustomNavigationController: UIViewControllerTransitioningDelegate {
    func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        CustomPushAnimation()
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        CustomPopAnimation()
    }
}

// MARK: - UINavigationControllerDelegate

extension CustomNavigationController: UINavigationControllerDelegate {
    func navigationController(
        _ navigationController: UINavigationController,
        interactionControllerFor animationController: UIViewControllerAnimatedTransitioning
    ) -> UIViewControllerInteractiveTransitioning? {
        interactiveTransition.hasStarted ? interactiveTransition : nil
    }

    func navigationController(
        _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationController.Operation,
        from fromVC: UIViewController,
        to toVC: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            interactiveTransition.viewController = toVC
            return CustomPushAnimation()
        } else if operation == .pop {
            if navigationController.viewControllers.first != toVC {
                interactiveTransition.viewController = toVC
            }
            return CustomPopAnimation()
        }
        return nil
    }
}
