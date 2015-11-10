//
//  LeftViewController.swift
//  slidingmenu
//
//  Created by 周周 on 15/11/10.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {
    var delegate: LeftViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClick(sender: UIButton) {
        delegate?.onClick()
    }

}

protocol LeftViewControllerDelegate {
    func onClick()
}
