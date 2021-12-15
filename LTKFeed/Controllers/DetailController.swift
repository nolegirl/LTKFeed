//
//  DetailController.swift
//  LTKFeed
//
//  Created by Mechelle Sieglitz on 12/14/21.
//

import Foundation
import UIKit

class DetailController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var profileView: UIImageView!
    
    var post:LTK?
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        self.heroImage.image = post?.heroImage
    }
    
    //MARK: Actions
    
    //MARK: Helpers
}
