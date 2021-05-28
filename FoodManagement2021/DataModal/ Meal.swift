//
//   Meal.swift
//  FoodManagement2021
//
//  Created by Nguyen Tien on 5/21/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class Meal {
    var mealName:String
    var mealImage:UIImage?
    var mealRatingValue:Int
    
    init?(mealName:String,mealImage:UIImage?,mealRatingValue:Int) {
        if(mealName == ""){
            return nil
        }
        if mealRatingValue>5||mealRatingValue<0 {
            return nil
        }
        self.mealName = mealName
        self.mealImage = mealImage
        self.mealRatingValue = mealRatingValue
    }
}
	
