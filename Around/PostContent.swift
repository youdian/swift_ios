//
//  PostContent.swift
//  Around
//
//  Created by 周周 on 15/6/14.
//  Copyright (c) 2015年 youdian.org. All rights reserved.
//

import UIKit

class PostContent: NSObject {
    
    var content : String
    var author : String
    init(content: String, author : String) {
        self.content = content
        self.author = author
    }
    override init() {
        content = ""
        author = ""
    }
   
}
