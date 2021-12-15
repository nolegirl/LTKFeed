//
//  DetailController.swift
//  LTKFeed
//
//  Created by Mechelle Sieglitz on 12/14/21.
//

import Foundation
import UIKit

class DetailController: UIViewController, UICollectionViewDataSource {
    
    //MARK: Properties
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var profileView: UIImageView!
    
    var post:LTK?
    var products:[Product]?
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        self.heroImage.image = post?.heroImage
        self.products = post?.products
        self.collectionView.dataSource = self
    }
    
    //MARK: Actions
    
    //MARK: Helpers
    
    //MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a reference to our storyboard cell
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath as IndexPath) as! ProductCell
                
        let post = self.products?[indexPath.row] as! Product
                // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.productImageView.image = post.productImage// The row value is the same as the index of the desired text within the array.
                 // make cell more visible in our example project
                
                return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return post?.products?.count ?? 0
    }
    
    
}
