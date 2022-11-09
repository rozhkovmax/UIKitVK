// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран авторизации
final class LoginViewController: UIViewController {
    // MARK: - Private IBOutlet

    @IBOutlet private var loginScrollView: UIScrollView!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var thirdAnimateCircleView: UIView!
    @IBOutlet private var secondAnimateCircleView: UIView!
    @IBOutlet private var firstAnimateCircleView: UIView!

    // MARK: - Life Cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardAddObserver()
        circleViewAnimation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        keyboardRemoveObserver()
    }

    // MARK: - Public Methods

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == Constants.Identifiers.identifierSingInID,
              checkLoginInfo()
        else {
            showAlertController(
                alertTitle: Constants.OtherConstants.alertTitleText,
                alertMessage: Constants.OtherConstants.alertMessageText,
                alertActionTitle: Constants.OtherConstants.alertActionTitleText
            )
            return false
        }
        return true
    }

    // MARK: - Private Methods

    private func circleViewAnimation() {
        UIView.animate(
            withDuration: 0.6,
            delay: 0.1,
            options: .autoreverse,
            animations: { self.firstAnimateCircleView.alpha = 0 }
        )
        UIView.animate(
            withDuration: 0.6,
            delay: 0.3,
            options: .autoreverse,
            animations: { self.secondAnimateCircleView.alpha = 0 }
        )
        UIView.animate(
            withDuration: 0.6,
            delay: 0.5,
            options: .autoreverse,
            animations: { self.thirdAnimateCircleView.alpha = 0 }
        )
    }

    private func keyboardAddObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShownAction(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHideAction(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardAction))
        loginScrollView.addGestureRecognizer(tapGesture)
    }

    private func keyboardRemoveObserver() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }

    private func checkLoginInfo() -> Bool {
        guard loginTextField.text == Constants.OtherConstants.loginText,
              loginTextField.text == Constants.OtherConstants.passwordText else { return false }
        return true
    }

    @objc private func keyboardWillShownAction(notification: Notification) {
        guard let info = notification.userInfo as? NSDictionary,
              let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue)?.cgRectValue
              .size else { return }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        loginScrollView.contentInset = contentInsets
        loginScrollView.scrollIndicatorInsets = contentInsets
    }

    @objc private func keyboardWillHideAction(notification: Notification) {
        loginScrollView.contentInset = UIEdgeInsets.zero
        loginScrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }

    @objc private func hideKeyboardAction() {
        loginScrollView.endEditing(true)
    }
}
