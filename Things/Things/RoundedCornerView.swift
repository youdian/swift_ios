//
//  RoundedCornerView.swift
//  Things
//
//  Created by 周周 on 15/11/24.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedCornerView: UIView {
    @IBInspectable
    var cornerRadius: CGFloat = 5 {
        didSet {
            print("set cornerRadius to \(cornerRadius)")
            self.layer.cornerRadius = cornerRadius
            if cornerRadius > 0 {
                self.layer.masksToBounds = true
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initCornerRadius()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initCornerRadius()
        
    }
    
    func initCornerRadius() {
        cornerRadius = 5
    }
    
}
