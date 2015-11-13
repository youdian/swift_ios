//
//  CustomTitleViewController.swift
//  navigationcontroller
//
//  Created by 周周 on 15/11/13.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class CustomTitleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let segmentedView = UISegmentedControl(items: ["First", "Second"])
        self.navigationItem.titleView = segmentedView
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "backToMain" {
                if let destController = segue.destinationViewController as? ViewController {
                    destController.title = "Main from Third View Controller"
                    destController.receivedString = "received a string from third view controller"
                }
            }
        }
    }


}
