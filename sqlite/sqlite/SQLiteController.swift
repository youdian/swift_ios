//
//  SQLiteController.swift
//  sqlite
//
//  Created by 周周 on 15/11/8.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class SQLiteController: NSObject {
    // database name
    let db_name = "example.db"
    let db_version = 2
    let key_db_version = "db_version"
    let sql_create_table = "create table if not exists desc (id integer primary key autoincrement, title text, desc text)"
    let sql_query = "select * from desc"
    var db: COpaquePointer = nil
    var isConnected = false
    let queue = dispatch_queue_create("DatabaseQueue", DISPATCH_QUEUE_SERIAL)
    
    class var sharedInstance: SQLiteController {
        struct Singletion {
            static let instance = SQLiteController()
        }
        return Singletion.instance
    }
    
    private func open() -> Bool {
        if isConnected {
            return true
        }
        let dir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        let path = dir.stringByAppendingString(db_name)
        let result = sqlite3_open((path as NSString).cStringUsingEncoding(NSUTF8StringEncoding), &db)
        if result == SQLITE_OK {
            isConnected = true
            print("database opened successfully\n", terminator: "")
            return true
        } else {
            let errMsg = String.fromCString(sqlite3_errmsg(db))
            print("can't open database:\(errMsg)\n", terminator: "")
            return false
        }
        
    }
    
    func executeQuery(query: String) -> [[String: String]] {
        if !open() {
            return [[String: String]]()
        }
        var stmt: COpaquePointer = nil
        let result = sqlite3_prepare_v2(db, query, -1, &stmt, nil)
        if result == SQLITE_OK {
            print("query \(query) is successful\n")
            var array = [[String: String]]()
            while sqlite3_step(stmt) == SQLITE_ROW {
                let columnCount = sqlite3_column_count(stmt)
                var dic = [String: String]()
                var i: Int32 = 0
                while (i < columnCount) {
                    let columnName = String.fromCString(sqlite3_column_name(stmt, i))
                    let columnValue = String.fromCString(UnsafePointer<Int8>(sqlite3_column_text(stmt, i)))
                    print("\(columnName):\(columnValue)\n")
                    dic[columnName!] = columnValue
                    i++
                }
                array.append(dic)
            }
            return array
         } else {
            let errMsg = sqlite3_errmsg(db)
            print("query \(query) failed with error msg: \(String.fromCString(errMsg))\n", terminator: "")
        }
        return [[String: String]]()
    }
    
    func executeNoQuery(sql: String) {
        if !open() {
            return
        }
        var error: UnsafeMutablePointer<Int8> = nil
        let result = sqlite3_exec(db, sql, nil, nil, &error)
        if result == SQLITE_OK {
            print("sql executed successfully\n")
        } else {
            print("sql execute failed: \(String.fromCString(error))")
        }
    }
    
    func upgradeDatabase(var localVersion: Int, newVersion: Int) {
        while localVersion < newVersion {
            switch localVersion {
            case 0:
                executeNoQuery(sql_create_table)
            case 1:
                executeNoQuery("alter table desc add column link text")
            default:
                break
            }
            ++localVersion
        }
        NSUserDefaults.standardUserDefaults().setInteger(newVersion, forKey: key_db_version)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    override init() {
        super.init()
        let localVersion = NSUserDefaults.standardUserDefaults().integerForKey(key_db_version)
        print("localVersion:\(localVersion)")
        if (localVersion < db_version) {
            upgradeDatabase(localVersion, newVersion: db_version)
        }
    }
    
    deinit {
        isConnected = false
        sqlite3_close_v2(db)
    }

}
