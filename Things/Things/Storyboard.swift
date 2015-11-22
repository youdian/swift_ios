//
//  Storyboard.swift
//  Things
//
//  Created by 周周 on 15/11/18.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

// 与storyboard 相关的工具类
class Storyboard: NSObject {
    // 根据storyboard名称和identifier获取 UIViewController
    static func viewControllerFromStoryboard(storyboardName: String, withIdentifier identifier: String) -> UIViewController {
        let storyboard = storyboardWithName(storyboardName)
        return storyboard.instantiateViewControllerWithIdentifier(identifier)
    }
    
    // 获取storyboard
    static func storyboardWithName(name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: NSBundle.mainBundle())
    }
}
