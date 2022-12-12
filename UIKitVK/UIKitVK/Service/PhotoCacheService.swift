// PhotoCacheService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import UIKit

/// Сервис для кеширования изображений
final class PhotoCacheService {
    // MARK: - Private Properties

    private let cacheLifeTime: TimeInterval = Constants.OtherConstants.cacheLifeTime
    private let container: DataReloadable
    private static let pathName: String = {
        let pathName = Constants.OtherConstants.imagePathName
        guard let cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        else { return pathName }
        let url = cachesDirectory.appendingPathComponent(pathName, isDirectory: true)
        if !FileManager.default.fileExists(atPath: url.path) {
            try? FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
        }
        return pathName
    }()

    private var imagesMap = [String: UIImage]()

    // MARK: - Initializator

    init(container: UITableViewController) {
        self.container = TableVC(tableVC: container)
    }

    init(container: UICollectionViewController) {
        self.container = CollectionVC(collectionVC: container)
    }

    init(container: UITableView) {
        self.container = Table(table: container)
    }

    // MARK: - Public Methods

    func photo(byUrl url: String) -> UIImage? {
        var image: UIImage?
        if let photo = imagesMap[url] {
            image = photo
        } else if let photo = getImageFromCache(url: url) {
            image = photo
        } else {
            loadPhoto(byUrl: url)
        }
        return image
    }

    // MARK: - Private Methods

    private func getFilePath(url: String) -> String? {
        guard let cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        else { return nil }
        let hashName = url.split(separator: Constants.OtherConstants.separator).last ?? Constants.OtherConstants
            .defaultFileName
        return cachesDirectory
            .appendingPathComponent(PhotoCacheService.pathName + String(Constants.OtherConstants.separator) + hashName)
            .path
    }

    private func saveImageToCache(url: String, image: UIImage) {
        guard let fileName = getFilePath(url: url),
              let data = image.pngData() else { return }
        FileManager.default.createFile(atPath: fileName, contents: data, attributes: nil)
    }

    private func getImageFromCache(url: String) -> UIImage? {
        guard let fileName = getFilePath(url: url),
              let info = try? FileManager.default.attributesOfItem(atPath: fileName),
              let modificationDate = info[FileAttributeKey.modificationDate] as? Date else { return nil }
        let lifeTime = Date().timeIntervalSince(modificationDate)
        guard lifeTime <= cacheLifeTime,
              let image = UIImage(contentsOfFile: fileName) else { return nil }
        DispatchQueue.main.async {
            self.imagesMap[url] = image
        }
        return image
    }

    private func loadPhoto(byUrl url: String) {
        AF.request(url).responseData(queue: DispatchQueue.global()) { [weak self] response in
            guard let data = response.data,
                  let self = self,
                  let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.imagesMap[url] = image
            }
            self.saveImageToCache(url: url, image: image)
            DispatchQueue.main.async {
                self.container.reloadRow()
            }
        }
    }
}
