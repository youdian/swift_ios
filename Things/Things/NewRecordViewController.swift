//
//  NewRecordViewController.swift
//  Things
//
//  Created by 周周 on 15/11/18.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class NewRecordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("appEnterBackground:"), name: UIApplicationDidEnterBackgroundNotification, object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func appEnterBackground(notification: NSNotification) {
        print("receive notification:\(notification.name)")
        self.presentedViewController?.dismissViewControllerAnimated(false, completion: nil)
    }
    
    @IBAction func showSelectPictureDialog(sender: UIButton) {
        let alertController = UIAlertController(title: "title", message: "this is message", preferredStyle: .ActionSheet)
        let popOver = alertController.popoverPresentationController
        if popOver != nil {
            popOver?.sourceView = sender
            popOver?.sourceRect = sender.bounds
            popOver?.permittedArrowDirections = .Any
        }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.Default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        presentViewController(alertController, animated: true, completion: nil)
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
