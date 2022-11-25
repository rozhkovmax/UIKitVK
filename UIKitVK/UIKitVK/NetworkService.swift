// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import Foundation

/// Сетевой сервис
final class NetworkService {
    // MARK: - Public Methods

    func fetchFriends(completion: @escaping ([User]) -> Void) {
        let parameters: Parameters = [
            Constants.UrlComponents.userIdKey: Session.shared.userId,
            Constants.UrlComponents.friendsFieldsKey: Constants.UrlComponents.friendsFieldsValue,
            Constants.UrlComponents.accessTokenKey: Session.shared.token,
            Constants.UrlComponents.versionKey: Constants.UrlComponents.versionValue
        ]
        let path = Constants.UrlComponents.baseUrl + Constants.UrlComponents.friendsMethod
        AF.request(path, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            do {
                let result = try JSONDecoder().decode(ResultUser.self, from: data)
                let users = result.response.users
                completion(users)
            } catch {
                completion([])
            }
        }
    }

    func fetchPhotos(ownerID: Int, completion: @escaping ([Photo]) -> Void) {
        let parameters: Parameters = [
            Constants.UrlComponents.ownerIdKey: ownerID,
            Constants.UrlComponents.accessTokenKey: Session.shared.token,
            Constants.UrlComponents.versionKey: Constants.UrlComponents.versionValue
        ]
        let path = Constants.UrlComponents.baseUrl + Constants.UrlComponents.photosMethod
        AF.request(path, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            do {
                let result = try JSONDecoder().decode(ResultPhoto.self, from: data)
                let photos = result.response.photos
                completion(photos)
            } catch {
                completion([])
            }
        }
    }

    func fetchUserGroups(completion: @escaping ([Group]) -> Void) {
        let parameters: Parameters = [
            Constants.UrlComponents.userIdKey: Session.shared.userId,
            Constants.UrlComponents.myGroupExtendedKey: Constants.UrlComponents.myGroupExtendedValue,
            Constants.UrlComponents.accessTokenKey: Session.shared.token,
            Constants.UrlComponents.versionKey: Constants.UrlComponents.versionValue
        ]
        let path = Constants.UrlComponents.baseUrl + Constants.UrlComponents.myGroupMethod
        AF.request(path, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            do {
                let result = try JSONDecoder().decode(ResultGroup.self, from: data)
                let groups = result.response.groups
                completion(groups)
            } catch {
                completion([])
            }
        }
    }

    func fetchGroup(group searchText: String, completion: @escaping ([Group]) -> Void) {
        let parameters: Parameters = [
            Constants.UrlComponents.otherGroupSearch: searchText,
            Constants.UrlComponents.accessTokenKey: Session.shared.token,
            Constants.UrlComponents.versionKey: Constants.UrlComponents.versionValue
        ]
        let path = Constants.UrlComponents.baseUrl + Constants.UrlComponents.otherGroupSearch
        AF.request(path, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            do {
                let result = try JSONDecoder().decode(ResultGroup.self, from: data)
                let groups = result.response.groups
                completion(groups)
            } catch {
                completion([])
            }
        }
    }
}
