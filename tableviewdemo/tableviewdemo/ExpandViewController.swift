//
//  ExpandViewController.swift
//  tableviewdemo
//
//  Created by 周周 on 15/11/29.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class ExpandViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    var refreshView: RefreshView!
    var expandId = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        table.rowHeight = UITableViewAutomaticDimension
        refreshView = RefreshView(frame: CGRectMake(0, -CGRectGetHeight(table.bounds), CGRectGetWidth(table.bounds), CGRectGetHeight(table.bounds)))
        refreshView.delegate = self
        table.addSubview(refreshView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        let queue = NSOperationQueue()
        let blockOperation = NSBlockOperation(block: {
            NSThread.sleepForTimeInterval(3)
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.refreshView.finishLoading()
                print("finish loading")
            })
        })
        queue.addOperation(blockOperation)
    }

}

extension ExpandViewController: RefreshViewDelegate {
    func onLoading() {
        performSelector("loadData", withObject: self)
    }
}

extension ExpandViewController: UITableViewDelegate, UITableViewDataSource {
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating...")
        refreshView.scrollViewDidEndDecelerating(scrollView)
    }
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        refreshView.scrollViewDidEndDragging(scrollView, willDecelerate: decelerate)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
//        print("scrollViewDidScroll...")
        refreshView.scrollViewDidScroll(scrollView)
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
        var identifier: String
        if indexPath.row == expandId {
            identifier = "expand_cell"
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! ExpandCell
            cell.first.text = "first \(indexPath.row)"
            cell.second.text = "second \(indexPath.row)"
            return cell
        } else {
            identifier = "normal_cell"
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! ExpandCell
            cell.first.text = "first \(indexPath.row)"
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        var invalidIndexPath = [indexPath]
        if expandId == indexPath.row {
            expandId = -1
        } else if expandId == -1 {
            expandId = indexPath.row
        } else {
            let oldExpandId = expandId
            expandId = indexPath.row
            invalidIndexPath.append(NSIndexPath(forRow: oldExpandId, inSection: 0))
            
        }
        tableView.reloadRowsAtIndexPaths(invalidIndexPath, withRowAnimation: .Automatic)
        tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .None, animated: true)
    }
}