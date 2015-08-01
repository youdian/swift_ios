//
//  AppDelegate.swift
//  pageview
//
//  Created by 周周 on 15/8/1.
//  Copyright (c) 2015年 youdian.org. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let keyVersion = "version"
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let prefs = NSUserDefaults.standardUserDefaults()
        let versionOld = prefs.integerForKey(keyVersion)
        let bundle: [String: AnyObject] = NSBundle.mainBundle().infoDictionary as! [String: AnyObject]
        let versionName = bundle["CFBundleVersion"] as! String
        let versionCurrent = versionName.toInt()!
        println("current version = \(versionName)")
        if versionCurrent == versionOld {
            let mainViewController = storyBoard.instantiateViewControllerWithIdentifier("mainController") as! MainViewController
            window?.rootViewController = mainViewController
        } else {
            let introViewController = storyBoard.instantiateViewControllerWithIdentifier("introPage") as! IntroViewController
            window?.rootViewController = introViewController
            prefs.setInteger(versionCurrent, forKey: keyVersion)
            prefs.synchronize()
        }
        window?.makeKeyAndVisible()
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


}

