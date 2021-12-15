//
//  Product.swift
//  LTKFeed
//
//  Created by Mechelle Sieglitz on 12/14/21.
//

import Foundation
import UIKit

struct Product {
    let id: String
    let imageUrlString: String
    let productImage:UIImage
    let hyperlink:String
    
    init(dictionary:[String: Any]) {
        self.id = dictionary["id"] as! String
        self.imageUrlString = dictionary["image_url"] as! String
        let url = URL(string: imageUrlString)
        self.productImage = FeedService.loadImage(url: url!)
        self.hyperlink = dictionary["hyperlink"] as! String
    }
}
