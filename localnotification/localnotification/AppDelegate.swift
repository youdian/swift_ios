//
//  AppDelegate.swift
//  localnotification
//
//  Created by 周周 on 15/12/9.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit
//实际效果和文档中不一致。当app在最前面时收到本地通知，会同时弹出通知和调用didReceiveLocalNotification,点击通知会调用didReceiveLocalNotification.如果app在后台,点击通知会打开app并调用didReceiveLocalNotification.如果app未运行,点击通知会发生异常
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        if let options = launchOptions {
            print("launchOptions not nil")
            let notification = options[UIApplicationLaunchOptionsLocalNotificationKey] as? UILocalNotification
            if let notification = notification {
                let userInfo = notification.userInfo
                let text = userInfo!["title"] as? String
                if let text = text {
                    AppDelegate.saveText("\(text) from launch")
                } else {
                    AppDelegate.saveText("text is nil from launch")
                }
            } else {
                AppDelegate.saveText("notification is nil from launch")
            }

        } else {
            print("launchOptions is nil")
        }
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        print("receive local notification")
            let userInfo = notification.userInfo
            let text = userInfo!["title"] as? String
            if let text = text {
                AppDelegate.saveText("\(text)")
            } else {
                AppDelegate.saveText("text is nil")
            }

    }
    
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        
    }
    
    static func saveText(text: String) {
        NSUserDefaults.standardUserDefaults().setObject(text, forKey: "text")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

}

