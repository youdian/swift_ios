//
//  BannerView.swift
//  bannerdemo
//
//  Created by 周周 on 15/8/2.
//  Copyright (c) 2015年 youdian.org. All rights reserved.
//

import UIKit
import Foundation
protocol BannerViewAdapter {
    
}

class BannerView: UIScrollView {
    var firstView: UIImageView!
    var secondView: UIImageView!
    var space :CGFloat = 0
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "panGesture:"))
    }
    
    override func layoutSubviews() {
        let viewSize = self.bounds.size
        firstView = UIImageView(frame: CGRectMake(0, 0, viewSize.width, viewSize.height))
        firstView.backgroundColor = UIColor.grayColor()
        firstView.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: "tapGesture:")
        tapGesture.numberOfTapsRequired = 1
//        tapGesture.setValue("0", forUndefinedKey: "index")
        firstView.addGestureRecognizer(tapGesture)
        addSubview(firstView)
        let secondGesture = UITapGestureRecognizer(target: self, action: "tapGesture:")
        secondGesture.numberOfTapsRequired = 1
//        secondGesture.setValue("1", forUndefinedKey: "index")
        secondView = UIImageView(frame: CGRectMake(viewSize.width + space, 0, viewSize.width, viewSize.height))
        secondView.userInteractionEnabled = true
        secondView.addGestureRecognizer(secondGesture)
        addSubview(secondView)
        contentSize = CGSize(width: viewSize.width * 2, height: viewSize.height)
        showsHorizontalScrollIndicator = false
        
    }
    
    func panGesture(gesture: UIPanGestureRecognizer) {
        println("Pan gesture detected.")
    }
    
    func tapGesture(gesture: UITapGestureRecognizer) {
//        let index = gesture.valueForKey("index") as! Int
//        println("you click item \(index + 1)")
        println("you click item.")
    }

}
