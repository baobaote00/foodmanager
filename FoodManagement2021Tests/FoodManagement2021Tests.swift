//
//  FoodManagement2021Tests.swift
//  FoodManagement2021Tests
//
//  Created by CNTT on 4/16/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import XCTest
@testable import FoodManagement2021

class FoodManagement2021Tests: XCTestCase {

    func testMealCreateSuccess() {
        let meal1 = Meal(mealName: "tien",mealImage: nil, mealRatingValue: 3)
        XCTAssertNotNil(meal1)
        let meal2 = Meal(mealName: "tien",mealImage: nil, mealRatingValue: 0)
        XCTAssertNotNil(meal2)
        let meal3 = Meal(mealName: "tien",mealImage: nil, mealRatingValue: 5)
        XCTAssertNotNil(meal3)
    }
    func testMealCreateFail() {
        //test name empty
        let emptyMealName = Meal(mealName: "", mealImage: nil, mealRatingValue: 3)
        XCTAssertNil(emptyMealName)
        //test rating value > 5
        let overRatingValue = Meal(mealName: "te", mealImage: nil, mealRatingValue: 6)
        XCTAssertNil(overRatingValue)
        //test raing value < 0
        let negativeRatingValue = Meal(mealName: "te", mealImage: nil, mealRatingValue: -1)
        XCTAssertNil(negativeRatingValue)
    }

}
