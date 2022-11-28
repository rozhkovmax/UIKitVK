// UIImageView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Расширение для получения изображения
extension UIImageView {
    func loadImage(url: String) {
        let networkService = NetworkService()
        DispatchQueue.main.async {
            guard let image = UIImage(data: networkService.loadImageData(url: url)) else { return }
            self.image = image
        }
    }
}
