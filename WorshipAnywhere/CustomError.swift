//
//  CustomError.swift
//  WorshipAnywhere
//
//  Created by rw3 on 12/30/15.
//  Copyright © 2015 XNI Technologies, LLC. All rights reserved.
//

import Foundation

class CustomError : NSObject
{
   static func error(reason: String) -> NSError
   {
       return NSError(domain: "com.xnitech.WorshipAnywhere", code: 200, userInfo: ["Error Reason" : reason])
   }
}