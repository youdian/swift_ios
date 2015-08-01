//
//  ViewController.swift
//  pageview
//
//  Created by 周周 on 15/8/1.
//  Copyright (c) 2015年 youdian.org. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIPageViewControllerDataSource {
    var pageViewController: UIPageViewController!
    var pageTitles:[String]!
    var pageImages:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        pageTitles = ["Page One", "Page Two", "Page Three", "Page Four"]
        pageImages = ["intro1", "intro2", "intro3", "intro4"]
        pageViewController = storyboard?.instantiateViewControllerWithIdentifier("pageContainer") as! UIPageViewController
        pageViewController.dataSource = self
        let startingViewController = contentViewControllerAtIndex(0)
        let viewControllers:[ColorViewController] = [startingViewController]
        pageViewController.setViewControllers(viewControllers, direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
//        pageViewController?.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        pageViewController.view.frame = self.view.bounds
        addChildViewController(pageViewController!)
        view.addSubview(pageViewController!.view)
        didMoveToParentViewController(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func contentViewControllerAtIndex(index: Int) -> ColorViewController {
        let colorContentView: ColorViewController = storyboard?.instantiateViewControllerWithIdentifier("colorContent") as! ColorViewController
        colorContentView.pageIndex = index
        colorContentView.pageCount = pageTitles.count
        let red = Double(index) / Double(pageTitles.count) + 0.1
        colorContentView.redPercent = CGFloat(red)
        colorContentView.imageName = pageImages[index]
        return colorContentView
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let colorViewController = viewController as! ColorViewController
        var index = colorViewController.pageIndex
        if (index >= pageTitles.count - 1) {
            return nil
        }
        index++
        return contentViewControllerAtIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let colorViewController = viewController as! ColorViewController
        var index = colorViewController.pageIndex
        if (index == 0) {
            return nil
        }
        index--
        return contentViewControllerAtIndex(index)
    }
// implement below 2 methods will add an UIPageControl beneath the content view controller
//    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return pageTitles.count
//    }
//    
//    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return 0
//    }


}

