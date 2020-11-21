//
//  UIImageView+Extension.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import UIKit

extension UIImageView {
    
    /** Fetches and sets a `UIImageView` `image` from a URL string */
    func setImage(fromUrl url: String) {
        ImageLoader.shared.request(url) { result in
            switch result {
            case .success (let image):
                self.image = image
            case .failure:
                self.image = UIImage(named: "default-image")
            }
        }
    }
}
