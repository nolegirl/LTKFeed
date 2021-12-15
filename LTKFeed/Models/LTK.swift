//
//  LTK.swift
//  LTKFeed
//
//  Created by Mechelle Sieglitz on 12/14/21.
//

import Foundation

struct LTK {
    let heroImage: String
    let profileId: String
    let caption: String
    var productIds: [String]?
    
    init(dictionary:[String: Any]) {
        self.heroImage = dictionary["hero_image"] as! String
        self.profileId = dictionary["profile_id"] as! String
        self.caption = dictionary["caption"] as! String
    }
}
