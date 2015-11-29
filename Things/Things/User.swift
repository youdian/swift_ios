//
//  User.swift
//  Things
//
//  Created by 周周 on 15/11/25.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import Foundation

class User {
    static var username: String? {
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey(Keys.username.rawValue) as? String
        }
        
        set {
            NSUserDefaults.standardUserDefaults().setObject(username, forKey: Keys.username.rawValue)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    static var sessionToken: String? {
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey(Keys.sessionToken.rawValue) as? String
        }
        set {
            return NSUserDefaults.standardUserDefaults().setObject(sessionToken, forKey: Keys.sessionToken.rawValue)
        }
    }
    
    static var objectId: String? {
        get {
        return NSUserDefaults.standardUserDefaults().objectForKey(Keys.userObjectId.rawValue) as? String
        }
        set {
            return NSUserDefaults.standardUserDefaults().setObject(objectId, forKey: Keys.userObjectId.rawValue)
        }
    }
}