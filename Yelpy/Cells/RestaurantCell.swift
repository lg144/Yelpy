//
//  RestaurantCell.swift
//  Yelpy
//
//  Created by Leslie Giron on 2/3/22.
//  Copyright © 2022 memo. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var foodCategory: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    //Add movie variable
    var r: Restaurant! {
        didSet {
            label.text = r.name
            foodCategory.text = r.mainCategory
            reviewsLabel.text = String(r.reviews) + " reviews"
            phoneLabel.text = r.phone
            
            //set images
            ratingImage.image = Stars.dict[r.rating]!
            restaurantImage.af.setImage(withURL: r.imageURL!)
            restaurantImage.layer.cornerRadius = 10
            restaurantImage.clipsToBounds = true
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
