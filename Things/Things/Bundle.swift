//
//  Bundle.swift
//  Things
//
//  Created by 周周 on 15/11/18.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import Foundation

class Bundle: NSObject {
    
    static var bundleVersion: String {
        return NSBundle.mainBundle().infoDictionary!["CFBundleVersion"] as! String
    }
}