//
//  ImageCacheService.swift
//  gb_vk_client
//
//  Created by 5vi5t on 05.07.2022.
//

import UIKit

final class ImageCacheService {
    
    private lazy var imageCache: NSCache<AnyObject, AnyObject> = {
        let cache = NSCache<AnyObject, AnyObject>()
        cache.countLimit = 40
        return cache
    }()
    
    func getImage(for url: URL) -> UIImage? {
        if let image = imageCache.object(forKey: url as AnyObject) as? UIImage {
            return image
        } else {
            return nil
        }
    }
    
    func saveImage(_ image: UIImage?, with url: URL) {
        guard let image = image else {
            deleteImage(for: url)
            return
        }
        imageCache.setObject(image, forKey: url as AnyObject)
    }
    
    func deleteImage(for url: URL) {
        imageCache.removeObject(forKey: url as AnyObject)
    }
    
    func clearCache() {
        imageCache.removeAllObjects()
    }
    
    
    
    
}
