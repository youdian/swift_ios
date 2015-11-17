//
//  IntroViewController.swift
//  Things
//
//  Created by 周周 on 15/11/17.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    static let pageCount = 3
    @IBOutlet weak var pageControl: UIPageControl!
    var pageViewController: IntroPageViewController!
    var nextPageIndex = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier(ViewControllerIdentifiers.introPageViewController.rawValue) as! IntroPageViewController
        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.setViewControllers([pageContentViewControllerAtIndex(0)], direction: .Forward, animated: false, completion: nil)
        self.addChildViewController(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMoveToParentViewController(self)
        view.bringSubviewToFront(pageControl)
        pageControl.numberOfPages = IntroViewController.pageCount
        pageControl.currentPage = 0
        addCloseNotification()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageContentViewControllerAtIndex(index: Int) -> IntroContentViewController {
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(ViewControllerIdentifiers.introContentViewController.rawValue) as! IntroContentViewController
        viewController.pageIndex = 0
        return viewController
        
    }
    
    func addCloseNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleNotification:", name: "close_intro_page", object: nil)
    }

    func handleNotification(notification: NSNotification) {
        print("receiver notification")
        UIView.animateWithDuration(0.5, animations: {
            self.view.frame.origin.y = self.view.frame.height
            }, completion: {
                completed in
                self.view.removeFromSuperview()
        })
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

extension IntroViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier(ViewControllerIdentifiers.introContentViewController.rawValue) as! IntroContentViewController
        if let currViewController = viewController as? IntroContentViewController {
            let currPageIndex = currViewController.pageIndex
            if currPageIndex == IntroViewController.pageCount - 1{
                return nil
            }
            nextViewController.pageIndex = currPageIndex + 1
        } else {
            nextViewController.pageIndex = 0
        }
        return nextViewController
        
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let previousViewController = self.storyboard?.instantiateViewControllerWithIdentifier(ViewControllerIdentifiers.introContentViewController.rawValue) as! IntroContentViewController
        if let currViewController = viewController as? IntroContentViewController {
            let currPageIndex = currViewController.pageIndex
            if currPageIndex == 0 {
                return nil
            }
        }
        return previousViewController
    }
    
    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        if pendingViewControllers.count == 0 {
            return
        }
        let pageContentViewController = pendingViewControllers[0] as! IntroContentViewController
        nextPageIndex = pageContentViewController.pageIndex
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    if completed {
        pageControl.currentPage = nextPageIndex
    }
    }
    
}
