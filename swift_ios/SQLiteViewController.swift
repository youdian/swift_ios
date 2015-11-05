//
//  SQLiteViewController.swift
//  swift_ios
//
//  Created by 周周 on 15/10/27.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit
import SQLite

class SQLiteViewController: UIViewController {
    let db_name = "test.db"
    let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
    var db: Connection?
    let id = Expression<Int64>("id")
    let email = Expression<String>("email")
    let name = Expression<String?>("name")
    let users = Table("users")
    override func viewDidLoad() {
        super.viewDidLoad()
        db = try? Connection("\(path)/\(db_name)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func createDatabase(sender: UIButton) {
        let result = try? db?.run(users.create(ifNotExists: true){
            t in
            t.column(id, primaryKey: true)
            t.column(email, unique: true)
            t.column(name)
        })
    }
    

    @IBAction func insert(sender: UIButton) {
        try? db!.run(users.insert(email <- "alice@google.com", name <- "Alice"))
    }
    @IBAction func query(sender: UIButton) {
        for user in try! db!.prepare(users) {
            print("id: \(user[id]), email: \(user[email]), name: \(user[name])")
        }
    }
    @IBAction func deleteRecord(sender: UIButton) {
    }
    @IBAction func update(sender: UIButton) {
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
