//
//  ViewController.swift
//  scrollviewdemo
//
//  Created by 周周 on 15/8/15.
//  Copyright (c) 2015年 youdian.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labe: UILabel!
    
    let text = "这首歌是剧中人物芳汀因拒绝工厂老板调戏而丢掉了工作，为了养活女儿不得不卖掉长发，被拽掉牙齿，并出卖自己的身体成为妓女的场景。她怀念过去和旧情人美好的时光，怨恨自己天真，痛恨情人无情和这个世界的冷酷。"
    override func viewDidLoad() {
        super.viewDidLoad()
        labe.text = text
        labe.backgroundColor = UIColor.brownColor()
        scrollView.backgroundColor = UIColor.lightGrayColor()
        scrollView.contentInset = UIEdgeInsets(top: 100,left: 0,bottom: 0,right: 0)
        let hiddenLabel = UILabel(frame: CGRectMake(0, -100, 320, 100))
        hiddenLabel.text = "隐藏的label"
        hiddenLabel.backgroundColor = UIColor.blackColor()
        scrollView.addSubview(hiddenLabel)
        println("scrollView offset:\(scrollView.contentOffset)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

