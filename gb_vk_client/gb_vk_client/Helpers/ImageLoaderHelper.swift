//
//  ImageLoaderHelper.swift
//  gb_vk_client
//
//  Created by 5vi5t on 05.07.2022.
//

import UIKit

final class ImageLoaderHelper {
    private let loaderService = ImageLoaderService()
    private let cacheService = ImageCacheService()
    
    func loadImage(url: String, completion: @escaping (UIImage) -> Void) {
        guard let url = URL(string: url) else { return }
        if let image = cacheService.getImage(for: url) {
            completion(image)
        }
        loaderService.loadImage(url: url) { [weak self] result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data),
                      let self = self else { return }
                self.cacheService.saveImage(image, with: url)
                completion(image)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
