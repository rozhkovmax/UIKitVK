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

    // MARK: - Private Properties

    private lazy var service = NetworkService()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        service.friendsRequest()
    }

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
            withDuration: Constants.AnimationOptions.circleAnimationDuration,
            delay: Constants.AnimationOptions.circleAnimationFirstDelay,
            options: .autoreverse,
            animations: { self.firstAnimateCircleView.alpha = Constants.AnimationOptions.circleAnimationAlpha }
        )
        UIView.animate(
            withDuration: Constants.AnimationOptions.circleAnimationDuration,
            delay: Constants.AnimationOptions.circleAnimationSecondDelay,
            options: .autoreverse,
            animations: { self.secondAnimateCircleView.alpha = Constants.AnimationOptions.circleAnimationAlpha }
        )
        UIView.animate(
            withDuration: Constants.AnimationOptions.circleAnimationDuration,
            delay: Constants.AnimationOptions.circleAnimationThirdDelay,
            options: .autoreverse,
            animations: { self.thirdAnimateCircleView.alpha = Constants.AnimationOptions.circleAnimationAlpha }
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
        let contentInsets = UIEdgeInsets(
            top: Constants.OtherConstants.scrollViewContentInsetTop,
            left: Constants.OtherConstants.scrollViewContentInsetLeft,
            bottom: keyboardSize.height,
            right: Constants.OtherConstants.scrollViewContentInsetRight
        )
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
