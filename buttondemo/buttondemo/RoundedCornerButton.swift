//
//  RoundedCornerButton.swift
//  buttondemo
//
//  Created by 周周 on 15/8/2.
//  Copyright (c) 2015年 youdian.org. All rights reserved.
//

import UIKit

class RoundedCornerButton: UIButton {

    override var highlighted: Bool {
        didSet {
            if highlighted {
                backgroundColor = UIColor.blackColor()
            } else {
                backgroundColor = UIColor.grayColor()
            }
        }
    }

}
