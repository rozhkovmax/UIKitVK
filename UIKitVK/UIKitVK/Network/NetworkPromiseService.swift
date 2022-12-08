// NetworkPromiseService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import Foundation
import PromiseKit

/// Сетевой сервис PromiseKit
final class NetworkPromiseService {
    // MARK: - Public Methods

    func fetchPromiseFriends() -> Promise<[User]> {
        let parameters: Parameters = [
            Constants.URLComponents.userIdKey: Session.shared.userId,
            Constants.URLComponents.friendsFieldsKey: Constants.URLComponents.friendsFieldsValue,
            Constants.URLComponents.accessTokenKey: Session.shared.token,
            Constants.URLComponents.versionKey: Constants.URLComponents.versionValue
        ]
        let path = "\(Constants.URLComponents.baseUrl)\(Constants.URLComponents.friendsMethod)"
        let promise = Promise<[User]> { resolver in
            AF.request(path, parameters: parameters).responseData { response in
                guard let data = response.value else { return }
                do {
                    let result = try JSONDecoder().decode(ResultUser.self, from: data)
                    resolver.fulfill(result.response.users)
                } catch {
                    resolver.reject(error)
                }
            }
        }
        return promise
    }
}
