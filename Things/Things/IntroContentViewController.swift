//
//  IntroViewController.swift
//  Things
//
//  Created by 周周 on 15/11/17.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class IntroContentViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    var pageIndex = 0 {
        didSet {
            print("set pageIndex to value \(pageIndex)")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if pageIndex == IntroViewController.pageCount - 1 {
            startButton.hidden = false
        }
        imageView.image = UIImage(named: "Intro")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gotoApp(sender: UIButton) {
        gotoMainPage()
    }
    
    func gotoMainPage() {
        let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let mainController = storyBoard.instantiateInitialViewController()
        mainController?.modalTransitionStyle = .FlipHorizontal
        presentViewController(mainController!, animated: true, completion: nil)
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
