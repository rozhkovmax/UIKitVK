// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import Foundation

/// Сетевой сервис
final class NetworkService {
    // MARK: - Public Methods

    func fetchFriends() {
        let parameters: Parameters = [
            Constants.UrlComponents.userIdKey: Session.shared.userId,
            Constants.UrlComponents.friendsFieldsKey: Constants.UrlComponents.friendsFieldsValue,
            Constants.UrlComponents.accessTokenKey: Session.shared.token,
            Constants.UrlComponents.versionKey: Constants.UrlComponents.versionValue
        ]
        let path = Constants.UrlComponents.baseUrl + Constants.UrlComponents.friendsMethod
        AF.request(path, parameters: parameters).responseData { response in
            guard let value = response.value else { return }
            print(value)
        }
    }

    func fetchPhotos() {
        let parameters: Parameters = [
            Constants.UrlComponents.userIdKey: Session.shared.userId,
            Constants.UrlComponents.accessTokenKey: Session.shared.token,
            Constants.UrlComponents.versionKey: Constants.UrlComponents.versionValue
        ]
        let path = Constants.UrlComponents.baseUrl + Constants.UrlComponents.photosMethod
        AF.request(path, parameters: parameters).responseData { response in
            guard let value = response.value else { return }
            print(value)
        }
    }

    func fetchUserGroups() {
        let parameters: Parameters = [
            Constants.UrlComponents.userIdKey: Session.shared.userId,
            Constants.UrlComponents.myGroupExtendedKey: Constants.UrlComponents.myGroupExtendedValue,
            Constants.UrlComponents.accessTokenKey: Session.shared.token,
            Constants.UrlComponents.versionKey: Constants.UrlComponents.versionValue
        ]
        let path = Constants.UrlComponents.baseUrl + Constants.UrlComponents.myGroupMethod
        AF.request(path, parameters: parameters).responseData { response in
            guard let value = response.value else { return }
            print(value)
        }
    }

    func fetchGroup(group searchText: String) {
        let parameters: Parameters = [
            Constants.UrlComponents.otherGroupSearch: Constants.OtherConstants.emptyString,
            Constants.UrlComponents.accessTokenKey: Session.shared.token,
            Constants.UrlComponents.versionKey: Constants.UrlComponents.versionValue
        ]
        var param = parameters
        param[Constants.OtherConstants.emptyString] = searchText
        let path = Constants.UrlComponents.baseUrl + Constants.UrlComponents.otherGroupSearch
        AF.request(path, parameters: param).responseData { response in
            guard let value = response.value else { return }
            print(value)
        }
    }
}
