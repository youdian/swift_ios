//
//  RatingControl.swift
//  OfficialDemo
//
//  Created by 周周 on 15/7/12.
//  Copyright (c) 2015年 youdian.org. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    // MARK: Properties
    var rating = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    var ratingButtons = [UIButton]()
    // MARK: Initialization
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        var stars = 5
        for _ in 0..<stars {
            let button = UIButton()
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: UIControlState.Highlighted)
            button.adjustsImageWhenHighlighted = false
//            button.backgroundColor = UIColor.redColor()
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: UIControlEvents.TouchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
        for (index, btn) in enumerate(ratingButtons) {
            if (btn == button) {
                rating = index + 1;
                break
            }
        }
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in enumerate(ratingButtons) {
            button.selected = index < rating
        }
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var spacing = 5
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        for (index, button) in enumerate(ratingButtons){
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
    }

}
