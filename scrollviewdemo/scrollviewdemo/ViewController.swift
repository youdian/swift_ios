//
//  ViewController.swift
//  scrollviewdemo
//
//  Created by 周周 on 15/8/15.
//  Copyright (c) 2015年 youdian.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var headImageView: UIImageView!
    var tableView: InnerTableView!
    let imageHeight: CGFloat = 150
    override func viewDidLoad() {
        super.viewDidLoad()
        headImageView = UIImageView()
        headImageView.image = UIImage(named: "HeaderImage")
        headImageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: imageHeight)
        headImageView.contentMode = .ScaleAspectFill
        scrollView.addSubview(headImageView)
        tableView = InnerTableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.frame = CGRect(x: 0, y: headImageView.bounds.height, width: view.bounds.width, height: 0)
        tableView.heightChangedDelegate = self
        scrollView.addSubview(tableView)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 0)
        print(view.bounds)
        print(scrollView.bounds)
        scrollView.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }


}

extension ViewController: InnerTableViewDelegate {
    func tableView(tableView: InnerTableView, heightChangedTo height: CGFloat) {
        scrollView.contentSize = CGSize(width: view.bounds.width, height: headImageView.bounds.height + height)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            let offset = scrollView.contentOffset.y
            print("offset=\(offset)")
            if offset < 0 {
                let percent = (-offset + imageHeight ) / imageHeight
                print("scale percent = \(percent)")
                headImageView.transform = CGAffineTransformMakeScale(percent, percent)
            } else if offset == 0 {
                headImageView.transform = CGAffineTransformIdentity
            }
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = "hello \(indexPath.row)"
        return cell
    }
}
