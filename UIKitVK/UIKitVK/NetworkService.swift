// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

import Alamofire

/// Сетевой сервис
final class NetworkService {
    // MARK: - Public Methods
    
    func friendsRequest() {
        let urlFriends =
        Constants.UrlComponents.baseUrl +
        Constants.UrlComponents.friendsMethod +
        Constants.UrlComponents.userId +
        Session.shared.userId +
        Constants.UrlComponents.accessToken +
        Session.shared.token +
        Constants.UrlComponents.friendsFields +
        Constants.UrlComponents.version
        AF.request(urlFriends).responseJSON { response in
            guard let value = response.value else { return }
            print(value)
        }
    }
    
    func photosRequest() {
        let urlPhotos =
        Constants.UrlComponents.baseUrl +
        Constants.UrlComponents.photosMethod +
        Constants.UrlComponents.userId +
        Session.shared.userId +
        Constants.UrlComponents.accessToken +
        Session.shared.token +
        Constants.UrlComponents.version
        AF.request(urlPhotos).responseJSON { response in
            guard let value = response.value else { return }
            print(value)
        }
    }
    
    func myGroupsRequest() {
        let urlMyGroups =
        Constants.UrlComponents.baseUrl +
        Constants.UrlComponents.myGroupMethod +
        Constants.UrlComponents.myGroupExtended +
        Constants.UrlComponents.userId +
        Session.shared.userId +
        Constants.UrlComponents.accessToken +
        Session.shared.token +
        Constants.UrlComponents.version
        AF.request(urlMyGroups).responseJSON { response in
            guard let value = response.value else { return }
            print(value)
        }
    }
    
    func otherGroupsRequest(group: String) {
        let urlMyGroups =
        Constants.UrlComponents.baseUrl +
        Constants.UrlComponents.otherGroupMethod +
        Constants.UrlComponents.userId +
        Session.shared.userId +
        Constants.UrlComponents.otherGroupSearch +
        group +
        Constants.UrlComponents.accessToken +
        Session.shared.token +
        Constants.UrlComponents.version
        AF.request(urlMyGroups).responseJSON { response in
            guard let value = response.value else { return }
            print(value)
        }
    }
}
