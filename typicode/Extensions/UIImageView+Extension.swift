//
//  UIImageView+Extension.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {

    /** Fetches and sets a `UIImageView` `image` from a URL string */
    func downloadImage(from imgURL: String, defaultImage: String = "default-image") -> URLSessionDataTask? {
        guard let url = URL(string: imgURL) else { return nil }

        // set default initial image
        image = UIImage(named: defaultImage)

        // check if the image is already in the cache
        if let imageToCache = imageCache.object(forKey: imgURL as NSString) {
            self.image = imageToCache
            return nil
        }

        // download the image asynchronously
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print(err)
                return
            }

            DispatchQueue.main.async {
                // create UIImage
                let imageToCache = UIImage(data: data!)
                // add image to cache
                imageCache.setObject(imageToCache!, forKey: imgURL as NSString)
                self.image = imageToCache
            }
        }
        task.resume()
        return task
    }
}

