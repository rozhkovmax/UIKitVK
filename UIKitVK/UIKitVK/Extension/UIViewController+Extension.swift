// UIViewController+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение UIViewController для вызова AlertController
extension UIViewController {
    // MARK: - Public Methods

    func showAlertController(alertTitle: String?, alertMessage: String?, alertActionTitle: String?) {
        let alertController = UIAlertController(
            title: alertTitle,
            message: alertMessage,
            preferredStyle: .alert
        )
        let alertControllerAction = UIAlertAction(title: alertActionTitle, style: .cancel)
        alertController.addAction(alertControllerAction)
        present(alertController, animated: true)
    }
}
