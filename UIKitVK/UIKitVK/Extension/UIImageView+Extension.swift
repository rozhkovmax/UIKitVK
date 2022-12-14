// UIImageView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для получения изображения
extension UIImageView {
    // MARK: - Public Methods

    func loadImage(_ url: String, networkService: NetworkService) {
        networkService.fetchImage(url) { [weak self] data in
            guard let self = self,
                  let data = data,
                  let image = UIImage(data: data) else { return }
            self.image = image
        }
    }
}
