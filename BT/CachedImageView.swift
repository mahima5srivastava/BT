//
//  LazyImageView.swift
//  BT
//
//  Created by Mahima Personal on 21/02/24.
//

import Foundation
import UIKit


class CachedImageView: UIImageView {
    
    private let imageCache = NSCache<AnyObject, UIImage>()
    
    func loadImage(from url: String) {
        guard let imageUrl = URL(string: url) else {return}
        if let existingImage = imageCache.object(forKey: imageUrl as AnyObject) {
            DispatchQueue.main.async {
                self.image = existingImage
                return
            }
        }
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: imageUrl) {
                if let downloadedImage = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.imageCache.setObject(downloadedImage, forKey: imageUrl as AnyObject)
                        self.image = downloadedImage
                    }
                }
            }
        }
    }
}
