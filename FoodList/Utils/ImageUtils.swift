//
//  ImageUtils.swift
//  FoodList
//
//  Created by Yumi JIn on 17/3/2564 BE.
//

import Kingfisher
import UIKit

class ImageUtils {
    
    static func loadImage(_ imageView :UIImageView,_ path : String?){
        guard let url = URL.init(string: path ?? "") else{
            imageView.image = UIImage(named: "placeholder")
            return
        }
        _ = imageView.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { (image, error, cacheType, imageUrl) in
            if let image = image{
                imageView.image = image
            }else{
                imageView.image = UIImage(named: "placeholder")
            }
        })
        
    }
}
