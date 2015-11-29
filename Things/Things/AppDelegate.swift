//
//  AppDelegate.swift
//  Things
//
//  Created by 周周 on 15/11/17.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        setupRootController()
        UINavigationBar.appearance().barTintColor = UIColor.colorFromRGB(Color.headerBgColor.rawValue)
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        return true
    }
    // 判断是否显示引导页
    func setupRootController() {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.makeKeyAndVisible()
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let bundleVersion = Int(Bundle.bundleVersion)
        print("bundleVersion:\(bundleVersion)")
        let savedBundleVersion = userDefaults.integerForKey(Keys.Key_Bundle_Version.rawValue)
        print("savedBundleVersion:\(savedBundleVersion)")
        userDefaults.setInteger(bundleVersion!, forKey: Keys.Key_Bundle_Version.rawValue)
        userDefaults.synchronize()
        if bundleVersion <= savedBundleVersion || !IntroViewController.hasNewIntroPage
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let rootController = storyBoard.instantiateInitialViewController()
            window?.rootViewController = rootController
            
        } else {
            let storyBoard = UIStoryboard(name: "Intro", bundle: NSBundle.mainBundle())
            let rootController = storyBoard.instantiateInitialViewController()
            window?.rootViewController = rootController
        }

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
    
    func application(application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: () -> Void) {
        
    }


}

