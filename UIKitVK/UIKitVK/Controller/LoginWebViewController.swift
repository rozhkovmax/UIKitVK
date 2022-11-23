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
        urlComponents.scheme = Constants.UrlComponents.scheme
        urlComponents.host = Constants.UrlComponents.host
        urlComponents.path = Constants.UrlComponents.path
        urlComponents.queryItems = [
            URLQueryItem(
                name: Constants.UrlComponents.queryItemsClientIdKeyName,
                value: Constants.UrlComponents.queryItemsClientIdValue
            ),
            URLQueryItem(
                name: Constants.UrlComponents.queryItemsDisplayKeyName,
                value: Constants.UrlComponents.queryItemsDisplayValue
            ),
            URLQueryItem(
                name: Constants.UrlComponents.queryItemsRedirectUriKeyName,
                value: Constants.UrlComponents.queryItemsRedirectUriValue
            ),
            URLQueryItem(
                name: Constants.UrlComponents.queryItemsScopeKeyName,
                value: Constants.UrlComponents.queryItemsScopeValue
            ),
            URLQueryItem(
                name: Constants.UrlComponents.queryItemsResponseTypeKeyName,
                value: Constants.UrlComponents.queryItemsResponseTypeValue
            ),
            URLQueryItem(
                name: Constants.UrlComponents.queryItemsVersionKeyName,
                value: Constants.UrlComponents.queryItemsVersionValue
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
        guard let url = navigationResponse.response.url, url.path == Constants.UrlComponents.urlPath,
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
        guard let token = params[Constants.UrlComponents.accessTokenKey] else { return }
        Session.shared.token = token
        guard let userId = params[Constants.UrlComponents.userIdKey] else { return }
        Session.shared.userId = userId
        decisionHandler(.cancel)
        performSegue(withIdentifier: Constants.Identifiers.identifierLoginID, sender: nil)
    }
}
