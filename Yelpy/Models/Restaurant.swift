//
//  Restaurant.swift
//  Yelpy
//
//  Created by Leslie Giron on 2/8/22.
//  Copyright © 2022 memo. All rights reserved.
//

import Foundation

class Restaurant {
    
    //Declare Variables
    var imageURL: URL?
    var url: URL?
    var name: String
    var mainCategory: String
    var phone: String
    var rating: Double
    var reviews: Int

    //Initialize variables
    init(dict: [String: Any]) {
        
        imageURL = URL(string: dict["image_url"] as! String)
        name = dict["name"] as! String
        phone = dict["display_phone"] as! String
        rating = dict["rating"] as! Double
        reviews = dict["review_count"] as! Int
        url = URL(string: dict["url"] as! String)
        mainCategory = Restaurant.getMainCategory(dict: dict)
        
    }
    
    //Helper function to get the first category from restaurant
    static func getMainCategory(dict: [String: Any]) -> String {
        
        let categories = dict["categories"] as! [[String: Any]]
        return categories[0]["title"] as! String
        
    }
    
}
