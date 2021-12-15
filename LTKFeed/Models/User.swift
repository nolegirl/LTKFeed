//
//  User.swift
//  LTKFeed
//
//  Created by Mechelle Sieglitz on 12/14/21.
//

import Foundation
import UIKit

struct User {
    let avatarUrlString: String
    let avatar: UIImage
    
    init(dictionary:[String: Any]) {
        self.avatarUrlString = dictionary["avatar_url"] as! String
        let url = URL(string: avatarUrlString)
        self.avatar = FeedService.loadImage(url: url!)
        
    }
}
