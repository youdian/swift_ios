//
//  ViewController.swift
//  sqlite
//
//  Created by 周周 on 15/11/8.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleContent: UITextField!
    @IBOutlet weak var desc: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func createTable(sender: UIButton) {
        SQLiteController.sharedInstance.executeNoQuery(SQLiteController.sharedInstance.sql_create_table)
    }

    @IBAction func insertRecord(sender: UIButton) {
        let title = titleContent.text!
        let content = desc.text!
        let sql = "insert into desc(title, desc) values ('\(title)', '\(content)')"
        SQLiteController.sharedInstance.executeNoQuery(sql)
    }
    @IBAction func queryRecords(sender: UIButton) {
        let array = SQLiteController.sharedInstance.executeQuery(SQLiteController.sharedInstance.sql_query)
        print(array)
    }
    @IBAction func deleteRecord(sender: UIButton) {
    }
}

