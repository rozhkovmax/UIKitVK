// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import Foundation

/// Сетевой сервис
final class NetworkService {
    // MARK: - Public Methods

    func fetchFriends(completion: @escaping ([Item]) -> Void) {
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
                let users = try JSONDecoder().decode(User.self, from: data)
                let friends = users.response.friends
                completion(friends)
            } catch {
                completion([])
            }
        }
    }

    func fetchPhotos(ownerID: Int, completion: @escaping ([AllPhoto]) -> Void) {
        let parameters: Parameters = [
            Constants.UrlComponents.ownerIdKey: ownerID,
            Constants.UrlComponents.accessTokenKey: Session.shared.token,
            Constants.UrlComponents.versionKey: Constants.UrlComponents.versionValue
        ]
        let path = Constants.UrlComponents.baseUrl + Constants.UrlComponents.photosMethod
        AF.request(path, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            do {
                let photos = try JSONDecoder().decode(Photo.self, from: data)
                let photoFriends = photos.response.photos
                completion(photoFriends)
            } catch {
                completion([])
            }
        }
    }

    func fetchUserGroups(completion: @escaping ([AllGroup]) -> Void) {
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
                let groups = try JSONDecoder().decode(Group.self, from: data)
                let userGroups = groups.response.groups
                completion(userGroups)
            } catch {
                completion([])
            }
        }
    }

    func fetchGroup(group searchText: String, completion: @escaping ([AllGroup]) -> Void) {
        let parameters: Parameters = [
            Constants.UrlComponents.otherGroupSearch: searchText,
            Constants.UrlComponents.accessTokenKey: Session.shared.token,
            Constants.UrlComponents.versionKey: Constants.UrlComponents.versionValue
        ]
        let path = Constants.UrlComponents.baseUrl + Constants.UrlComponents.otherGroupSearch
        AF.request(path, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            do {
                let groups = try JSONDecoder().decode(Group.self, from: data)
                let searchGroups = groups.response.groups
                completion(searchGroups)
            } catch {
                completion([])
            }
        }
    }
}
