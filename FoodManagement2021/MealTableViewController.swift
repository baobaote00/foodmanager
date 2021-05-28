//
//  MealTableViewController.swift
//  FoodManagement2021
//
//  Created by Nguyen Tien on 5/21/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {

    var mealList = [Meal]()
    
    override func viewDidLoad() {	
        super.viewDidLoad()

        if let meal = Meal(mealName: "oanh", mealImage: UIImage(named: "Image"), mealRatingValue: 5) {
            mealList += [meal]
            mealList += [meal]
            mealList += [meal]
            mealList += [meal]
        }
        
        navigationItem.leftBarButtonItem = editButtonItem
            
//        navigationItem.rightBarButtonItem =
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mealList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell", for: indexPath) as? MealTableViewCell{
            let meal = mealList[indexPath.row]
            
            cell.mealImage.image = meal.mealImage
            cell.mealName.text = meal.mealName
            cell.mealRatingController.ratingValue = meal.mealRatingValue
            
            return cell
        }else{
            fatalError("Can not create the cell")
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            mealList.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            print("tien")
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    @IBAction func unWindFromMealDetailToMealTableView(sender:UIStoryboardSegue){
        if let sourceControl = sender.source as? ViewController {
            if let meal = sourceControl.meal {
                let indexPath = IndexPath(row: mealList.count, section: 0)
                
                mealList+=[meal]
                
                tableView.insertRows(at: [	indexPath], with: .none)
            }
        }
        
    }
    /**
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
