//
//  NSURLRequest+Extension.swift
//  Things
//
//  Created by 周周 on 15/11/25.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import Foundation

extension NSMutableURLRequest {
    static func leanCloudRequestWithUrl(url: String, body: [String: String], needToken: Bool) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPBody = try? NSJSONSerialization.dataWithJSONObject(body, options: .PrettyPrinted)
        request.HTTPMethod = "POST"
        request.setValue("jbplckJEbP2MeM8OrRRatWcg", forHTTPHeaderField: "X-LC-Id")
        request.setValue("Nlz1TEFTCyaS8XVO9l9G9pPt", forHTTPHeaderField: "X-LC-Key")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if needToken {
            addToken(request)
        }
        return request
    }
    
    static func leanCloudRequestWithUrl(url: String, needToken: Bool) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "GET"
        request.setValue("jbplckJEbP2MeM8OrRRatWcg", forHTTPHeaderField: "X-LC-Id")
        request.setValue("Nlz1TEFTCyaS8XVO9l9G9pPt", forHTTPHeaderField: "X-LC-Key")
        if needToken {
            addToken(request)
        }
        return request
    }
    
    private static func addToken(request: NSMutableURLRequest) {
        let sessionToken = User.sessionToken
        if let token = sessionToken {
            request.setValue(token, forHTTPHeaderField: "X-LC-Session")
        } else {
            print("user not login")
        }
    }
}