//
//  UIAlertController+SimpleAlert.swift
//  Things
//
//  Created by 周周 on 15/11/25.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

extension UIAlertController {
    static func simpleAlertWithTitle(title: String, andMessage message: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "确定", style: .Default, handler: nil))
        return alertController
    }
}
