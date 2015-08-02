//
//  ViewController.swift
//  buttondemo
//
//  Created by 周周 on 15/8/2.
//  Copyright (c) 2015年 youdian.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //圆角，纯背景色按钮
    @IBOutlet weak var btn2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btn2.layer.cornerRadius = 8
        btn2.clipsToBounds  = true
        btn2.contentEdgeInsets = UIEdgeInsetsMake(10, 5, 10, 5)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

