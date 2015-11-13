//
//  ViewController.swift
//  navigationcontroller
//
//  Created by 周周 on 15/11/13.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var receivedString: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Main"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backToMain(segue: UIStoryboardSegue) {
        print(receivedString)
    }
}

