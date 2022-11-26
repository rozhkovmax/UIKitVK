// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import Foundation

/// Сетевой сервис
final class NetworkService {
    // MARK: - Public Methods

    func fetchFriends(completion: @escaping ([User]) -> Void) {
        let parameters: Parameters = [
            Constants.URLComponents.userIdKey: Session.shared.userId,
            Constants.URLComponents.friendsFieldsKey: Constants.URLComponents.friendsFieldsValue,
            Constants.URLComponents.accessTokenKey: Session.shared.token,
            Constants.URLComponents.versionKey: Constants.URLComponents.versionValue
        ]
        let path = Constants.URLComponents.baseUrl + Constants.URLComponents.friendsMethod
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
            Constants.URLComponents.ownerIdKey: ownerID,
            Constants.URLComponents.accessTokenKey: Session.shared.token,
            Constants.URLComponents.versionKey: Constants.URLComponents.versionValue
        ]
        let path = Constants.URLComponents.baseUrl + Constants.URLComponents.photosMethod
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
            Constants.URLComponents.userIdKey: Session.shared.userId,
            Constants.URLComponents.myGroupExtendedKey: Constants.URLComponents.myGroupExtendedValue,
            Constants.URLComponents.accessTokenKey: Session.shared.token,
            Constants.URLComponents.versionKey: Constants.URLComponents.versionValue
        ]
        let path = Constants.URLComponents.baseUrl + Constants.URLComponents.myGroupMethod
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
            Constants.URLComponents.otherGroupSearch: searchText,
            Constants.URLComponents.accessTokenKey: Session.shared.token,
            Constants.URLComponents.versionKey: Constants.URLComponents.versionValue
        ]
        let path = Constants.URLComponents.baseUrl + Constants.URLComponents.otherGroupSearch
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
