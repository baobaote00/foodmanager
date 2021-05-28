//
//  RatingControl.swift
//  FoodManagement2021
//
//  Created by Nguyen Tien on 5/7/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
   
    
    private var ratingButton=[UIButton]()
    @IBInspectable var starNumber:Int = 5{
        didSet{
            setUpRatingControl()
        }
    }
    @IBInspectable var starSize:CGSize = CGSize(width: 44.0, height: 44.0)
    @IBInspectable var ratingValue:Int = 0{
        didSet{
            updateRatingButton()
            setUpRatingControl()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpRatingControl()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUpRatingControl()
    }
    
    private func setUpRatingControl(){
        let bundle = Bundle(for: type(of: self))
        
        let normal = UIImage(named:"default",in: bundle,compatibleWith: .none)
        let pressed = UIImage(named: "press",in: bundle,compatibleWith: .none)
        let selected = UIImage(named: "select",in: bundle,compatibleWith: .none)
        
        //MARK: remove all owl rating button
        for button in ratingButton {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButton.removeAll();
        
        for _ in 0..<starNumber {
            let button = UIButton()
            button.setImage(normal, for: .normal)
            button.setImage(pressed, for: .highlighted)
            button.setImage(selected, for: .selected)
            
            //MARK: Setup button prototype
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = false
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = false
            //add rating button's action
            button.addTarget(self, action: #selector(ratingButtonPress(button:)), for: .touchUpInside)
            //add the button to the stack
            addArrangedSubview(button)
            //add the button to the aray to manage them
            ratingButton.append(button)
        }
        
        updateRatingButton()
    }
    
    @objc private func ratingButtonPress(button: UIButton){
        if let index = ratingButton.lastIndex(of: button) {
            if ratingValue == index + 1 {
                ratingValue -= 1
            }else{
                ratingValue = index+1
            }
        }
        updateRatingButton()
        
    }
    private func updateRatingButton(){
        for (i,button) in ratingButton.enumerated() {
            button.isSelected = i<ratingValue
        }
    }
    
    
}

