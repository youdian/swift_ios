//
//  Post.swift
//  Things
//
//  Created by 周周 on 15/11/22.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class Post: NSObject {
    var username: String!
    var time: Int64!
    var avatar: String?
    var content: String!
    var formattedTime: String {
        return String(time)
    }
    
    init(username: String, time: Int64, avatar: String, content: String) {
        self.username = username
        self.time = time
        self.avatar = avatar
        self.content = content
    }
    
    static func testData() -> [Post] {
        var posts = [Post]()
        posts.append(Post(username: "name 1", time: 1000, avatar: "Launch", content: "content 1"))
        posts.append(Post(username: "name 2", time: 1001, avatar: "Launch", content: "this is some content a little longer , it will occupy multiple lines. let me see the real effect."))
        posts.append(Post(username: "name 3 ", time: 1002, avatar: "Launch", content: "once , when professor facing the executor, he rembeer the day when his father took him to see the ice. "))
        return posts
    
    }
}
