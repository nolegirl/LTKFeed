//
//  FeedService.swift
//  LTKFeed
//
//  Created by Mechelle Sieglitz on 12/14/21.
//

import Foundation
//https://api-gateway.rewardstyle.com/api/ltk/v2/ltks/?featured=true&limit=20

struct FeedService {
    static func getFeedPosts( ) {
        let url:String = "https://api-gateway.rewardstyle.com/api/ltk/v2/ltks/?featured=true&limit=20"
        guard let serviceURL = URL(string: url) else {return}
        var request = URLRequest(url: serviceURL)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 20
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                let feedArray = NSMutableArray()
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.fragmentsAllowed) as! [String : Any]
                    
                    let feed = json["ltks"] as! NSArray
                    
                    for postDictionary in feed {
                        let dictionary = postDictionary as! [String: Any]
                        
                        let postLTK = LTK(dictionary: dictionary)
                        feedArray.add(postLTK)
                        print(postLTK)
                    
                    }
//                    completion(array)
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
