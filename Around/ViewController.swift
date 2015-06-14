//
//  ViewController.swift
//  Around
//
//  Created by 周周 on 15/6/14.
//  Copyright (c) 2015年 youdian.org. All rights reserved.
//

import UIKit
//UILabel当换行处有较长的文字显示不下时，会出现少显示一行的问题
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let Cell_Identifier = "PostContent"
    var contents: [PostContent] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50.0
        tableView.tableFooterView = UIView()
        initContents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cell : PostContentCell = tableView.dequeueReusableCellWithIdentifier(Cell_Identifier) as! PostContentCell
        let content = contents[indexPath.row]
        cell.content.preferredMaxLayoutWidth = CGRectGetWidth(tableView.bounds)
        cell.content.text = content.content
        cell.author.text = content.author
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        
        let height = cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
        println("height:\(height)")
        // 必须加上分隔符的高度，否则显示不正确
        return height + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : PostContentCell = tableView.dequeueReusableCellWithIdentifier(Cell_Identifier) as! PostContentCell
        let content = contents[indexPath.row]
        cell.content.lineBreakMode = NSLineBreakMode.ByWordWrapping
        cell.content.text = content.content
        cell.author.text = content.author
        return cell
    }
    
    func initContents() {
        contents.append(PostContent(content: "hello everyone", author : "xiaoming"))
        contents.append(PostContent(content: "i'd like to introcude my friend jack", author : "xiao hua"))
        contents.append(PostContent(content: "this is a large text that will occuoy multi lines. i want to be a prog. it is a long "
            + "way to go. i have my own dreams an i won't give up", author :"noname"))
        contents.append(PostContent(content: "this is a two line text.  i need to check out if the table view cell work properly", author : "goodbye"))
    }

}

