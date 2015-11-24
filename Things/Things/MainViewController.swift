//
//  ViewController.swift
//  Things
//
//  Created by 周周 on 15/11/17.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    @IBOutlet weak var postList: UITableView!
    var posts: [Post]!
    override func viewDidLoad() {
        super.viewDidLoad()
        postList.dataSource = self
        postList.delegate = self
        postList.rowHeight = UITableViewAutomaticDimension
        posts = Post.testData()
    }
    override func viewWillAppear(animated: Bool) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewRecord(segue: UIStoryboardSegue) {
    
    }

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        let cell = tableView.dequeueReusableCellWithIdentifier("post_cell") as! PostCell
//        let post = posts[indexPath.row]
//        cell.username.text = post.username
//        cell.time.text = post.formattedTime
//        cell.content.text = post.content
//        cell.layoutIfNeeded()
//        let contentHeight = cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
//        print(contentHeight)
//        return contentHeight + 1
//    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        var identifier = "post_cell"
        if row % 2 == 1 {
            identifier = "post_cell_large"
        }
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as! PostCell
        let post = posts[indexPath.row]
        cell.username.text = post.username
        cell.time.text = post.formattedTime
        cell.content.text = post.content
        cell.avatar.image = UIImage(named: "Smile")
        cell.avatar.layer.cornerRadius = cell.avatar.bounds.width / 2
        cell.avatar.layer.masksToBounds = true
        if row % 2 == 1 {
            cell.largeImage.image = UIImage(named: "Intro")
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! PostCell
        print("cell.width=\(cell.bounds.width), and content width=\(cell.content.bounds.width)")
        print("you select row \(indexPath.row)")
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
