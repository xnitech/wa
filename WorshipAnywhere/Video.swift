//
//  Video.swift
//  WorshipAnywhere
//
//  Created by rw3 on 12/30/15.
//  Copyright © 2015 XNI Technologies, LLC. All rights reserved.
//

import CloudKit
import UIKit

class Video: NSObject {
    var type: String!
    var date: NSDate!
    var path: String!
    var file: String!
    var thumb: String!
    var desc: String!
   
    init(type: String?, date: String?, path: String?, file: String?, thumb: String?, desc: String?)
    {
        self.type = type
        self.date = Video.dateFromString(date!)
        self.path = path
        self.file = file
        self.thumb = thumb
        self.desc = desc
    }
    
    static func dateFromString(dateString : String) -> NSDate
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-M-d"
        
        let date = dateFormatter.dateFromString(dateString)
        return date!
    }
}