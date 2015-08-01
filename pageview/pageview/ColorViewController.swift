//
//  ColorViewController.swift
//  pageview
//
//  Created by 周周 on 15/8/1.
//  Copyright (c) 2015年 youdian.org. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    var pageIndex: Int = 0
    var pageCount: Int = 0
    var redPercent: CGFloat = 1
    var imageName: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: redPercent, green: 0.5, blue: 0.5, alpha: 1)
        self.pageNumberLabel.text = "Page " + String(pageIndex + 1)
        introImageView.image = UIImage(named: imageName)
        if pageIndex == pageCount - 1 {
            startAppBtn.hidden = false
        } else {
            startAppBtn.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var pageNumberLabel: UILabel!

    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var startAppBtn: UIButton!
    @IBAction func launchApp(sender: UIButton) {
        println("start the app")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
