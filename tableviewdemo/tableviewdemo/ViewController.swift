//
//  ViewController.swift
//  tableviewdemo
//
//  Created by 周周 on 15/11/29.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    var labelText = " a long text that will occupy more than one line"
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        table.rowHeight = UITableViewAutomaticDimension
        performSelector("updateText", withObject: self, afterDelay: 3)
    }
    
    func updateText() {
        labelText = "First, instantiate an offscreen instance of a table view cell, one instance for each reuse identifier, that is used strictly for height calculations. (Offscreen meaning the cell reference is stored in a property/ivar on the view controller and never returned from tableView:cellForRowAtIndexPath: for the table view to actually render onscreen.) Next, the cell must be configured with the exact "
        table.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("label_cell", forIndexPath: indexPath) as! LabelCell
        cell.label.text = labelText
        return cell
    }
    
    //显示多行文本必须实现本方法，否则只能显示一行
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 45
    }
}
