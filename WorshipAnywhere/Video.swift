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
   var path: String!
   var file: String!
   var thumb: String!
   var desc: String!
   
   init(path: String?, file: String?, thumb: String?, desc: String?) {
      self.path = path
      self.file = file
      self.thumb = thumb
      self.desc = desc
   }
}