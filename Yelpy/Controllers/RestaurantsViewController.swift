//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    
    // ––––– TODO: Next, place TableView outlet here
    
    @IBOutlet weak var tableView: UITableView!
    
    // –––––– TODO: Initialize restaurantsArray
    //var restaurantsArray: [[String:Any]] = []
    var restaurantsArray: [Restaurant] = []
    
    // ––––– TODO: Add tableView datasource + delegate
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        getAPIData()
        tableView.rowHeight = 150
    }
    
    
    // ––––– TODO: Get data from API helper and retrieve restaurants
    func getAPIData() {
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            //print(restaurants)
            self.restaurantsArray = restaurants
            self.tableView.reloadData()  //reload data!
        }
    }
    
    //Protocol stubs
    
    //What type of cell are we configuring
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //The tableView(_:cellForRowAt:) method is called each time a cell is made or referenced.
        //Each cell will have a unique indexPath.row, starting at 0 for the first cell, 1 for the second and so on.
        //This makes the indexPath.row very useful to pull out objects from an array at particular index points and then use the information from a particular object to populate the views of our cell.
        
        //Create restaurant cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        //pull out a single restaurant from our restaurantsArray array
        let restaurant = restaurantsArray[indexPath.row]
        
        cell.r = restaurant
        
        return cell
        
        //The comment block below was refactor by the 4 lines of code above
        /*
        //Set Label to restaurant name for each cell
        cell.label.text = restaurant["name"] as? String ?? ""
        
        //Set image of restaurant
            //1. Get the image url string from the restaurant dictionary
        if let imageUrlString = restaurant["image_url"] as? String {
            //2. Get the convert url string –> url
            let imageUrl = URL(string:imageUrlString)
            //3. set image using the image url with AlamofireImage
            cell.restaurantImage.af.setImage(withURL: imageUrl!)
        }
        // Get categories
        let categories = restaurant["categories"] as! [[String: Any]]
        cell.foodCategory.text = categories[0]["title"] as? String
        
        //Get reviews
        let reviews = restaurant["review_count"] as! Int
        cell.reviewsLabel.text = String(reviews) + " Reviews"
        
        //Get phone number
        cell.phoneLabel.text = restaurant["display_phone"] as! String
        
        // Set stars images
        let reviewDouble = restaurant["rating"] as! Double
        cell.ratingImage.image = Stars.dict[reviewDouble]!
        
         */
        
    }
    
    //How many cells will there be
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //The numberOfRowsInSection method simply tells the table view how many rows, or cells in this case, to create.
        //How many cells do we want? Well, as many as we have restaurants. We can get that number by calling the count method on our restaurantsArray array.
        //So, instead of returning a hard coded number like 5 we will want to return restaurantsArray.count.
        return restaurantsArray.count
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell) {
        let r = restaurantsArray[indexPath.row]
        let detailViewController = segue.destination as! RestaurantDetailViewController
        detailViewController.r = r
        }
    }
}

// ––––– TODO: Create tableView Extension and TableView Functionality


