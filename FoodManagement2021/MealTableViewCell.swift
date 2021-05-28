//
//  MealTableViewCell.swift
//  FoodManagement2021
//
//  Created by Nguyen Tien on 5/21/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealRatingController: RatingControl!
    @IBOutlet weak var mealImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        mealImage.heightAnchor.constraint(equalToConstant: 40).isActive = false
//        
//        mealRatingController.ratingValue = 1
//        print( UITableViewCell.AccessoryType.none)
    }
}
