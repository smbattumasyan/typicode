//
//  ImageLoaderCache.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import UIKit

final class ImageLoaderCache {
    private let cache = NSCache<NSString, UIImage>()
    
    func image(forKey key: String) -> UIImage? {
        if let cachedImage = cache.object(forKey: key as NSString) {
            return cachedImage
        }
        
        return nil
    }
    
    func set(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func removeAll() {
        cache.removeAllObjects()
    }
}
