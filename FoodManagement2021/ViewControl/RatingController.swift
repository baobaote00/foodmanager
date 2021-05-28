//
//  RatingControl.swift
//  FoodManegement2021
//
//  Created by CNTT on 5/7/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    //MARK: Properties
    private var ratingButtons = [UIButton]()
    @IBInspectable var ratingValue:Int = 0 {
        didSet{
            updateRatingButtonState()
        }
    }
    @IBInspectable var starNumber:Int = 5 {
        didSet{
            setupRatingControl()
        }
    }
    @IBInspectable var starSize:CGSize = CGSize(width: 44.0, height: 44.0)
    
    //MARK: constructer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupRatingControl()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupRatingControl()
    }
    
    //MARK: Define of setup rating control
    private func setupRatingControl() {
        //load the rating image
        let bundle = Bundle(for: type(of: self))
        let normal = UIImage(named: "default", in: bundle, compatibleWith: .none)
        let press = UIImage(named: "press",  in: bundle, compatibleWith: .none)
        let selected = UIImage(named: "select",  in: bundle, compatibleWith: .none)
        
        //Remove all old rating button
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        for _ in 0..<starNumber {
            // create rating buttons
            let button = UIButton()
            // setup button's properties
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = false
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = false
            button.setImage(normal, for: .normal)
            button.setImage(press, for: .highlighted)
            button.setImage(selected, for: .selected)
            //Add rating button's action
            button.addTarget(self, action: #selector(ratingButtonPressed(button:)), for: .touchUpInside)
            // Add the button to the stack view
            addArrangedSubview(button)
            // Add the button to the array to manage them
            ratingButtons.append(button)
            
        }
        
        updateRatingButtonState()
    }
    
    //MARK: rating button's action
    @objc private func ratingButtonPressed(button : UIButton){
        //print("Called")
        if let index = ratingButtons.firstIndex(of: button) {
            print("Num ber of the button is: \(index + 1)")
            if(ratingValue == index + 1){
                ratingValue -= 1
            } else {
                ratingValue = index + 1
            }
        }
        
        updateRatingButtonState()
    }
    //MARK: Update rating button star
    private func updateRatingButtonState() {
        for (i, button) in ratingButtons.enumerated() {
            button.isSelected = i < ratingValue
        }
    }
}

