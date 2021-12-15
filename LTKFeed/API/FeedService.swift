//
//  FeedService.swift
//  LTKFeed
//
//  Created by Mechelle Sieglitz on 12/14/21.
//

import Foundation
import UIKit
//https://api-gateway.rewardstyle.com/api/ltk/v2/ltks/?featured=true&limit=20

struct FeedService {
    static func getFeedPosts(completion: @escaping([LTK]) -> Void) {
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
                    var productsIdsArray:[String] = []
            
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.fragmentsAllowed) as! [String : Any]
                    
                    let feed = json["ltks"] as! NSArray
                    
                    for postDictionary in feed {
                        let dictionary = postDictionary as! [String: Any]
                        var postLTK = LTK(dictionary: dictionary)
                       
                        
                        let productsMutableArray = NSMutableArray()
                        productsIdsArray = postLTK.productIds
                        let productsJsonArray = json["products"] as! NSArray
                        for productDictionary in productsJsonArray {
                            let dictionary = productDictionary as! [String: Any]
                            productsIdsArray.forEach { idString in
                                if dictionary["id"] as! String == idString { //matches a product in that ltk
                                    let productLTK = Product(dictionary: dictionary)
                                    productsMutableArray.add(productLTK)
                                }
                            }
                        }
                        let productsArray = productsMutableArray.copy()
                        postLTK.products = productsArray as? [Product]
                        
                        
                        feedArray.add(postLTK)
                        print(postLTK)
                        let array = feedArray.copy() as! [LTK]
                        completion(array)
                    }
                    
                    
                    
//                    completion(array)
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    static func loadImage(url: URL) -> UIImage {
        let data = try? Data(contentsOf: url)

        if let imageData = data {
            let image = UIImage(data: imageData) ?? UIImage()
            return image
        }
        return UIImage()
    }
}
