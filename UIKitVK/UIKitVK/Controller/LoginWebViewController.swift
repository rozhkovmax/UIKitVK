// LoginWebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Экран авторизации через Web
final class LoginWebViewController: UIViewController {
    // MARK: - Private IBOutlet

    @IBOutlet var loginWebView: WKWebView! {
        didSet {
            loginWebView.navigationDelegate = self
        }
    }

    // MARK: - Private Properties

    private var urlComponents = URLComponents()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadLoginWebView()
    }

    // MARK: - Private Methods

    private func loadLoginWebView() {
        urlComponents.scheme = Constants.URLComponents.scheme
        urlComponents.host = Constants.URLComponents.host
        urlComponents.path = Constants.URLComponents.path
        urlComponents.queryItems = [
            URLQueryItem(
                name: Constants.URLComponents.queryItemsClientIdKeyName,
                value: Constants.URLComponents.queryItemsClientIdValue
            ),
            URLQueryItem(
                name: Constants.URLComponents.queryItemsDisplayKeyName,
                value: Constants.URLComponents.queryItemsDisplayValue
            ),
            URLQueryItem(
                name: Constants.URLComponents.queryItemsRedirectUriKeyName,
                value: Constants.URLComponents.queryItemsRedirectUriValue
            ),
            URLQueryItem(
                name: Constants.URLComponents.queryItemsScopeKeyName,
                value: Constants.URLComponents.queryItemsScopeValue
            ),
            URLQueryItem(
                name: Constants.URLComponents.queryItemsResponseTypeKeyName,
                value: Constants.URLComponents.queryItemsResponseTypeValue
            ),
            URLQueryItem(
                name: Constants.URLComponents.queryItemsVersionKeyName,
                value: Constants.URLComponents.queryItemsVersionValue
            )
        ]
        guard let url = urlComponents.url else { return }
        let request = URLRequest(url: url)
        loginWebView.load(request)
    }
}

// MARK: - WKNavigationDelegate

extension LoginWebViewController: WKNavigationDelegate {
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationResponse:
        WKNavigationResponse,
        decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void
    ) {
        guard let url = navigationResponse.response.url, url.path == Constants.URLComponents.urlPath,
              let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: Constants.OtherConstants.ampersand)
            .map { $0.components(separatedBy: Constants.OtherConstants.equals) }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[Constants.OtherConstants.paramKeyIndex]
                let value = param[Constants.OtherConstants.paramValueIndex]
                dict[key] = value
                return dict
            }
        guard let token = params[Constants.URLComponents.accessTokenKey] else { return }
        Session.shared.token = token
        guard let userId = params[Constants.URLComponents.userIdKey] else { return }
        Session.shared.userId = userId
        decisionHandler(.cancel)
        performSegue(withIdentifier: Constants.Identifiers.identifierLoginID, sender: nil)
    }
}
