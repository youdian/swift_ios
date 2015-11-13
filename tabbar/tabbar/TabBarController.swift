//
//  TabBarController.swift
//  tabbar
//
//  Created by 周周 on 15/11/13.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initTabs()
//        self.tabBar.barTintColor = UIColor.blueColor()
        //global setup
        UITabBar.appearance().tintColor = UIColor.brownColor()
        self.delegate = self
    }
    
    func initTabs() {
        let controllers = self.viewControllers
        for var i = 0; i < controllers?.count; i++ {
            let tabItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Bookmarks, tag: i)
            controllers![i].tabBarItem = tabItem
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension TabBarController: UITabBarControllerDelegate {
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        print("you selected item\(item.tag)")

    }
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 2 {
            print("you are not login")
            return false
        }
        return true
    }
    
}
