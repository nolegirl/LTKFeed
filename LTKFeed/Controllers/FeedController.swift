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
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    //MARK: Actions
    
    //MARK: Helpers
    
    //MARK: UITableViewDatasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseIdentifier = "FeedCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! FeedCell? else {
          fatalError()
        }
        
        return cell
    }
}
