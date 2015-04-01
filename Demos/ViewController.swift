//
//  ViewController.swift
//  Demos
//
//  Created by zhou zhou on 15/3/29.
//  Copyright (c) 2015年 zhou zhou. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var data = [String]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        addElements(&data)
    }
    func addElements(inout data:[String]) {
        let count = 10;
//        for i in 1...10 {
//            data.append("string \(i)")
//        }
        for var i = 0; i < count; i++ {
            data.append("string \(i)")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "NormalCell"
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as UITableViewCell
        if cell.isEqual(nil){
            
        }
        let position = indexPath.row
        cell.textLabel?.text=data[position]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("you select row \(indexPath.row)")
    }
    
    
    

}

