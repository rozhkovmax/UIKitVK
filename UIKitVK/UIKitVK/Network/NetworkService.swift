// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import Foundation
import RealmSwift

/// Сетевой сервис
final class NetworkService {
    // MARK: - Public Methods

    func createURLWebView() -> URL? {
        var urlComponents = URLComponents()
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
        return urlComponents.url
    }

    func fetchFriends(completion: @escaping (Result<[User], Error>) -> Void) {
        let parameters: Parameters = [
            Constants.URLComponents.userIdKey: Session.shared.userId,
            Constants.URLComponents.friendsFieldsKey: Constants.URLComponents.friendsFieldsValue,
            Constants.URLComponents.accessTokenKey: Session.shared.token,
            Constants.URLComponents.versionKey: Constants.URLComponents.versionValue
        ]
        let path = "\(Constants.URLComponents.baseUrl)\(Constants.URLComponents.friendsMethod)"
        AF.request(path, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            do {
                let result = try JSONDecoder().decode(ResultUser.self, from: data)
                let users = result.response.users
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }
    }

    func fetchPhotos(ownerID: Int, completion: @escaping (Result<[Photo], Error>) -> Void) {
        let parameters: Parameters = [
            Constants.URLComponents.ownerIdKey: ownerID,
            Constants.URLComponents.accessTokenKey: Session.shared.token,
            Constants.URLComponents.versionKey: Constants.URLComponents.versionValue
        ]
        let path = "\(Constants.URLComponents.baseUrl)\(Constants.URLComponents.photosMethod)"
        AF.request(path, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            do {
                let result = try JSONDecoder().decode(ResultPhoto.self, from: data)
                let photos = result.response.photos
                completion(.success(photos))
            } catch {
                completion(.failure(error))
            }
        }
    }

    func fetchUserGroups(completion: @escaping (Result<[Group], Error>) -> Void) {
        let parameters: Parameters = [
            Constants.URLComponents.userIdKey: Session.shared.userId,
            Constants.URLComponents.myGroupExtendedKey: Constants.URLComponents.myGroupExtendedValue,
            Constants.URLComponents.accessTokenKey: Session.shared.token,
            Constants.URLComponents.versionKey: Constants.URLComponents.versionValue
        ]
        let path = "\(Constants.URLComponents.baseUrl)\(Constants.URLComponents.myGroupMethod)"
        AF.request(path, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            do {
                let result = try JSONDecoder().decode(ResultGroup.self, from: data)
                let groups = result.response.groups
                completion(.success(groups))
            } catch {
                completion(.failure(error))
            }
        }
    }

    func fetchGroup(group searchText: String, completion: @escaping (Result<[Group], Error>) -> Void) {
        let parameters: Parameters = [
            Constants.URLComponents.otherGroupSearch: searchText,
            Constants.URLComponents.accessTokenKey: Session.shared.token,
            Constants.URLComponents.versionKey: Constants.URLComponents.versionValue
        ]
        let path = "\(Constants.URLComponents.baseUrl)\(Constants.URLComponents.otherGroupSearch)"
        AF.request(path, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            do {
                let result = try JSONDecoder().decode(ResultGroup.self, from: data)
                let groups = result.response.groups
                completion(.success(groups))
            } catch {
                completion(.failure(error))
            }
        }
    }

    func fetchPostNews(completion: @escaping (Result<ResponseNews, Error>) -> Void) {
        let parameters: Parameters = [
            Constants.URLComponents.newsFiltersKey: Constants.URLComponents.newsFiltersPostValue,
            Constants.URLComponents.accessTokenKey: Session.shared.token,
            Constants.URLComponents.versionKey: Constants.URLComponents.versionValue
        ]
        let path = "\(Constants.URLComponents.baseUrl)\(Constants.URLComponents.newsMethod)"
        AF.request(path, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            do {
                let result = try JSONDecoder().decode(ResultNews.self, from: data)
                let news = result.response
                completion(.success(news))
            } catch {
                completion(.failure(error))
            }
        }
    }

    func fetchImage(_ url: String, _ completion: @escaping (Data?) -> Void) {
        AF.request(url).response { response in
            guard response.data != nil else { return }
            DispatchQueue.main.async {
                completion(response.data)
            }
        }
    }

    func fetchOperationGroups() {
        let operationQueue = OperationQueue()
        let request = getOperationRequest()
        let getDataOperation = GetDataOperation(request: request)
        operationQueue.addOperation(getDataOperation)
        let parseData = ParseData()
        parseData.addDependency(getDataOperation)
        operationQueue.addOperation(parseData)
        let saveToRealm = ReloadTableController()
        saveToRealm.addDependency(parseData)
        OperationQueue.main.addOperation(saveToRealm)
    }

    func getOperationRequest() -> DataRequest {
        let parameters: Parameters = [
            Constants.URLComponents.userIdKey: Session.shared.userId,
            Constants.URLComponents.myGroupExtendedKey: Constants.URLComponents.myGroupExtendedValue,
            Constants.URLComponents.accessTokenKey: Session.shared.token,
            Constants.URLComponents.versionKey: Constants.URLComponents.versionValue
        ]
        let path = "\(Constants.URLComponents.baseUrl)\(Constants.URLComponents.myGroupMethod)"
        let request = AF.request(path, parameters: parameters)
        return request
    }
}
