//
//  Meal.swift
//  OfficialDemo
//
//  Created by 周周 on 15/7/12.
//  Copyright (c) 2015年 youdian.org. All rights reserved.
//

import UIKit

class Meal: NSObject{
    
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory: AnyObject = NSFileManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    // MARK: Types
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    init?(name: String, photo: UIImage?, rating: Int) {
        self.name = name;
        self.photo = photo
        self.rating = rating
        super.init()
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
//    required init(coder aDecoder: NSCoder) {
//        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
//        
//        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
//    
//        let rating = aDecoder.decodeObjectForKey(PropertyKey.ratingKey) as! Int
//        super.init()
//    }
//    
//    func encodeWithCoder(aCoder: NSCoder) {
//        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
//        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
//        aCoder.encodeObject(rating, forKey: PropertyKey.ratingKey)
//    }
    
    
}