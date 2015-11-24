//
//  RoundedRectButton.swift
//  Things
//
//  Created by 周周 on 15/11/24.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedRectButton: UIButton {
    
    @IBInspectable
    var cornerRadius: CGFloat = 5 {
        didSet {
            guard cornerRadius >= 0 else {
                print("cornerRadius must be equals or greater than 0")
                return
            }
            self.layer.cornerRadius = cornerRadius
            if cornerRadius > 0 {
                self.layer.masksToBounds = true
            }
        }
    }
    
    @IBInspectable
    var normalStatusBgColor: UIColor! {
        didSet {
            let image = UIImage.backgroundImageFromColor(normalStatusBgColor, andSize: self.frame.size)
            self.setBackgroundImage(image, forState: .Normal)
        }
    }
    
    @IBInspectable
    var highlightedStatusBgColor: UIColor! {
        didSet {
            let image = UIImage.backgroundImageFromColor(highlightedStatusBgColor, andSize: self.frame.size)
            self.setBackgroundImage(image, forState: .Highlighted)
        }
    }

}
