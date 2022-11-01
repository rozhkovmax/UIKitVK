// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер входа в приложение
final class LoginViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let identifier = "singInSegue"
        static let loginText = "q"
        static let passwordText = "q"
        static let alertTitleText = "Внимание!"
        static let alertMessageText = "Введен неверный логин и/или пароль"
        static let alertActionTitleText = "OK"
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var loginScrollView: UIScrollView!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!

    // MARK: - Life Cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardAddObserver()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        keyboardRemoveObserver()
    }

    // MARK: - Public Methods

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == Constants.identifier {
            if checkLoginInfo() {
                return true
            } else {
                showLoginError()
                return false
            }
        }
        return true
    }

    // MARK: - Private IBAction

    @IBAction private func loginButton(_ sender: Any) {}

    // MARK: - Private Methods

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
        let login = Constants.loginText
        let password = Constants.passwordText
        guard let loginText = loginTextField.text, let passwordText = loginTextField.text else { return false }
        if loginText == login, passwordText == password {
            return true
        } else {
            return false
        }
    }

    private func showLoginError() {
        let alertController = UIAlertController(
            title: Constants.alertTitleText,
            message: Constants.alertMessageText,
            preferredStyle: .alert
        )
        let alertControllerAction = UIAlertAction(title: Constants.alertActionTitleText, style: .cancel)
        alertController.addAction(alertControllerAction)
        present(alertController, animated: true)
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
