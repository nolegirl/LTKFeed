//
//  LTK.swift
//  LTKFeed
//
//  Created by Mechelle Sieglitz on 12/14/21.
//

import Foundation
import UIKit

struct LTK {
    let heroImage: UIImage
    let profileId: String
    let caption: String
    var productIds: [String]
    var products:[Product]?
    var poster: User?
    
    init(dictionary:[String: Any]) {
        let heroImageString = dictionary["hero_image"] as! String
        let url = URL(string: heroImageString)
        self.heroImage = FeedService.loadImage(url: url!)
        self.profileId = dictionary["profile_id"] as! String
        self.caption = dictionary["caption"] as! String
        self.productIds = dictionary["product_ids"] as! [String]
    }
}
