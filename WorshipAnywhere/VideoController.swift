//
//  VideoController.swift
//  WorshipAnywhere
//
//  Created by rw3 on 12/30/15.
//  Copyright © 2015 XNI Technologies, LLC. All rights reserved.
//

import Foundation

class VideoController : NSObject
{
   var worshipVideos:[Video] = []
   var specialVideos:[Video] = []
   
   func addWorshipVideo(video: Video)
   {
      self.worshipVideos.append(video)
   }
   func addSpecialVideo(video: Video)
   {
      self.specialVideos.append(video)
   }
   
   func loadVideos(completion: (error : NSError?) ->Void)
   {
      self.worshipVideos.removeAll()
      self.specialVideos.removeAll()
      
      let postEndpoint: String = "http://www.stpaulserbin.org/stpaulserbin/videos.php"
      guard let url = NSURL(string: postEndpoint) else {
         return completion(error: CustomError.error("Unable to load URL"))
      }
      let urlRequest = NSURLRequest(URL: url)
      let config = NSURLSessionConfiguration.defaultSessionConfiguration()
      let session = NSURLSession(configuration: config)
      let task = session.dataTaskWithRequest(urlRequest, completionHandler: {
         (data, response, error) in
         guard let responseData = data else {
            return completion(error: CustomError.error("Unable to retrieve data from URL"))
         }
         guard error == nil else {
            return completion(error: error)
         }

         var post = NSArray()
         do {
            post = try NSJSONSerialization.JSONObjectWithData(responseData,
               options: []) as! NSArray
         } catch  {
            return completion(error: CustomError.error("Unable to convert data from URL to JSON"))
         }
         
         for element in post {
            if let type = element["video_type"] as? String {
               if let path = element["video_path"] as? String {
                  if let file = element["video_file"] as? String {
                     if let thumb = element["video_thumbnail"] as? String {
                        if let desc = element["video_description"] as? String {
                           if (type == "worship") {
                              self.addWorshipVideo(Video(path: path, file: file, thumb: thumb, desc: desc))
                           }
                           else if (type == "special") {
                              self.addSpecialVideo(Video(path: path, file: file, thumb: thumb, desc: desc))
                           }
                           else {
                              print ("Unknown type")
                           }
                        }
                     }
                  }
               }
            }
         }
         
         completion(error: nil);
         
      })
      task.resume()
   }
}