//
//  ViewController.swift
//  Things
//
//  Created by 周周 on 15/11/17.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(animated: Bool) {
        dealIntroPage()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dealIntroPage() {
        let bundleVersion = Int(Bundle.bundleVersion)
        print("bundleVersion:\(bundleVersion)")
        let savedBundleVersion = NSUserDefaults.standardUserDefaults().integerForKey(UserDefaultsKeys.Key_Bundle_Version)
        print("savedBundleVersion:\(savedBundleVersion)")
        if bundleVersion <= savedBundleVersion
        {
          return
        }
        NSUserDefaults.standardUserDefaults().setInteger(bundleVersion!, forKey: UserDefaultsKeys.Key_Bundle_Version)
        NSUserDefaults.standardUserDefaults().synchronize()
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(ViewControllerIdentifiers.introViewController.rawValue)
        addChildViewController(viewController!)
        view.addSubview(viewController!.view)
        viewController?.didMoveToParentViewController(self)
        
    }

}

