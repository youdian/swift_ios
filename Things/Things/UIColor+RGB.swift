//
//  UIColor+RGB.swift
//  Things
//
//  Created by 周周 on 15/11/24.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

extension UIColor {
    
    // 根据rgb颜色值转换UIColor
    static func colorFromRGB(rgb: Int) -> UIColor {
        let red = (rgb & 0x00FF0000) >> 16
        let green = (rgb & 0x0000FF00) >> 8
        let blue = rgb & 0x000000FF
        var alpha = (rgb & 0xFF000000) >> 24
        if alpha == 0 { //未设置透明度
            alpha = 255
        }
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 255.0)
    }
    
    static func colorFromRGB(red: Int, green: Int, blue: Int, alpha: Int) -> UIColor {
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 255.0)
    }
    
}
