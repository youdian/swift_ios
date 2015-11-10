//
//  ViewController.swift
//  slidingmenu
//
//  Created by 周周 on 15/11/10.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var centerNavigationController: UINavigationController!
    var leftViewController: LeftViewController!
    var centerViewController: CenterViewController!
    let offset: CGFloat = 60
    let scaleFactor: CGFloat = 0.6
    let duration = 0.5
    var menuShowing = false
    var originX: CGFloat {
        get {
            return self.centerNavigationController.view.frame.origin.x
        }
        set {
            self.centerNavigationController.view.layer.shadowOpacity = newValue == 0 ? 0 : 0.5
            let dura = Double(abs(newValue - originX) / maxOriginX) * duration
            print("anim duration:\(dura)")
            UIView.animateWithDuration(dura, delay: 0, options: .CurveEaseOut, animations: {
                    self.centerNavigationController.view.frame.origin.x = newValue
                }, completion: {completed in
                    print("originX:\(newValue)\n", terminator: "")
            })
            
            
        }
    }
    var maxOriginX: CGFloat {
        return self.view.bounds.width - offset
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addCenterViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCenterViewController() {
        centerViewController = UIStoryboard.centerViewController()
        centerViewController.delegate = self
        centerNavigationController = UINavigationController(rootViewController: centerViewController)
        self.view.addSubview(centerNavigationController.view)
        addChildViewController(centerNavigationController)
        centerNavigationController.didMoveToParentViewController(self)
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: Selector("handlePanGesture:"))
        self.centerNavigationController.view.addGestureRecognizer(gestureRecognizer)
    }
    
    func handlePanGesture(recognizer: UIPanGestureRecognizer) {
        switch(recognizer.state) {
        case .Began:
            if (leftViewController == nil) {
                addLeftViewController()
            }
        case .Changed:
            let translation = recognizer.translationInView(self.view)
            self.centerNavigationController.view.frame.origin.x = min(max(0, originX + translation.x), maxOriginX)
            recognizer.setTranslation(CGPointZero, inView: self.view)
            
        case .Cancelled:
            fallthrough
        case .Ended:
            if self.originX < self.view.bounds.width / 2 {
                originX = 0
            } else {
                originX = maxOriginX
            }
            
        default:
            break
        }

    }
    
    func addLeftViewController() {
        leftViewController = UIStoryboard.leftViewController()
        leftViewController.delegate = centerViewController
        self.view.insertSubview(leftViewController.view, atIndex: 0)
        addChildViewController(leftViewController)
        leftViewController.didMoveToParentViewController(self)
    }
    
    func animateCenterViewController() {
        if leftViewController == nil {
            addLeftViewController()
        }
        
        if originX > 0 {
            originX = 0
        } else {
            originX = maxOriginX
        }

    }


}

extension ViewController: CenterViewControllerDelegate {
    
    func showMenu() {
        animateCenterViewController()
    }
    
    func hideMenu() {
        animateCenterViewController()
    }
    
}

private extension UIStoryboard {
    static func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    }
    
    static func leftViewController() -> LeftViewController {
        return mainStoryboard().instantiateViewControllerWithIdentifier("leftViewController") as! LeftViewController
    }
    
    static func centerViewController() -> CenterViewController {
        return mainStoryboard().instantiateViewControllerWithIdentifier("centerViewController") as! CenterViewController
    }
}