//
//  ViewController.swift
//  FoodManagement2021
//
//  Created by CNTT on 4/16/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    //MARK: - Properties
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var edtMenuName: UITextField!
    @IBOutlet weak var btnSave: UIBarButtonItem!
    @IBOutlet weak var ratingControl: RatingControl!
    
    var meal:Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        edtMenuName.delegate = self;
    }
    
    //MARK: - TextField's Delegate Function
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let menuName = textField.text {
//            print("text field"+menuName)
            navigationItem.title = menuName
        }
    }
    
    //MARK: - Image Processing
    @IBAction func imageProcessing(_ sender: UITapGestureRecognizer) {
        //hide the keybore
        edtMenuName.resignFirstResponder()
        //get images from phôt library
        let imagePicker = UIImagePickerController();
        //config the image's sourse
        imagePicker.sourceType = .photoLibrary;
        imagePicker.delegate = self;
        //show the image picker
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            selectedImage.image = imageSelected;
            // hide the image picker controller
            dismiss(animated: true, completion: nil);
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: sender)
        
        if let button = sender as? UIBarButtonItem , button === btnSave {
            let mealName = edtMenuName.text ?? ""
            let mealImage = selectedImage.image
            var ratingValue = ratingControl.ratingValue
//            
//            if ratingValue != 0  {
//                ratingValue -= 5
//            }
            
            meal = Meal(mealName: mealName, mealImage: mealImage, mealRatingValue: ratingValue)
        }
    }
}


