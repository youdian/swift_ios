//
//  ViewController.swift
//  localnotification
//
//  Created by 周周 on 15/12/9.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var content: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func showContent(sender: UIButton) {
        let text = NSUserDefaults.standardUserDefaults().objectForKey("text") as? String
        if let text = text {
            content.text = text
        } else {
            content.text = "text is nil"
        }
    }
    @IBAction func sendLocalNotification(sender: UIButton) {
        let localNotification = UILocalNotification()
        localNotification.alertBody = "this is alert body"
        localNotification.alertTitle = "simple title"
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
        localNotification.timeZone = NSTimeZone.localTimeZone()
        localNotification.hasAction = true
        let userInfo = ["title": "receive a notification"]
        localNotification.userInfo = userInfo
        if UIApplication.sharedApplication().respondsToSelector(Selector("registerUserNotificationSettings:")) {
            let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge], categories: nil)
            UIApplication.sharedApplication().registerUserNotificationSettings(settings)

        }
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

