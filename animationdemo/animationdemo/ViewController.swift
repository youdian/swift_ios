//
//  ViewController.swift
//  animationdemo
//
//  Created by 周周 on 15/8/11.
//  Copyright (c) 2015年 youdian.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var purpleView: UIView!
    var blueView: UIView!
    var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRectMake(100, 100, 100, 100)
        let childFrame = CGRectMake(0, 0, 100, 100)
        containerView = UIView(frame: frame)
        purpleView = UIView(frame: childFrame)
        purpleView.backgroundColor = UIColor.purpleColor()
        purpleView.hidden = true
        blueView = UIView(frame: childFrame)
        blueView.backgroundColor = UIColor.blueColor()
        containerView.addSubview(purpleView)
        containerView.addSubview(blueView)
        self.view.addSubview(containerView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func transitionView(sender: UIButton) {
        UIView.transitionWithView(self.containerView,
            duration: 1.0,
            options: UIViewAnimationOptions.TransitionFlipFromLeft,
            animations: {
            () -> Void in
            self.purpleView.hidden = !self.purpleView.hidden
            self.blueView.hidden = !self.blueView.hidden
            }, completion: nil)
    }
    

}

