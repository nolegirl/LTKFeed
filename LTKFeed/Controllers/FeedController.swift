//
//  FeedController.swift
//  LTKFeed
//
//  Created by Mechelle Sieglitz on 12/14/21.
//

import Foundation
import UIKit

class FeedController: UITableViewController {
    //MARK: Properties
    var postsArray = [LTK] () {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        FeedService.getFeedPosts { ltkArray in
            self.postsArray = ltkArray
        }
    }
    
    //MARK: Actions
    
    //MARK: Helpers
    
    //MARK: UITableViewDatasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseIdentifier = "FeedCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! FeedCell? else {
          fatalError()
        }
        
        let post = self.postsArray[indexPath.row]
        cell.feedImageView.image = post.heroImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    //MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = self.postsArray[indexPath.row]
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailController") as! DetailController
        controller.post = post
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
