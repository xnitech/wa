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
    var videos:[Video] = []
   
    func addVideo(video: Video)
    {
        self.videos.append(video)
    }

    func loadVideos(type: String, completion: (error : NSError?) ->Void)
    {
        self.videos.removeAll()
      
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
            }
            catch  {
                return completion(error: CustomError.error("Unable to convert data from URL to JSON"))
            }
         
            for element in post {
                if let vtype = element["video_type"] as? String {
                    if let vdate = element["video_date"] as? String {
                        if let path = element["video_path"] as? String {
                            if let file = element["video_file"] as? String {
                                if let thumb = element["video_thumbnail"] as? String {
                                    if let desc = element["video_description"] as? String {
                                        if (vtype == type) {
                                            self.addVideo(Video(type: vtype, date: vdate, path: path, file: file, thumb: thumb, desc: desc))
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            self.sortVideosByDateDesc()
         
            completion(error: nil);
         
        })
        task.resume()
    }
    
    func count() -> Int
    {
        return self.videos.count
    }
    
    func sortVideosByDateDesc()
    {
        self.videos.sortInPlace { (v1, v2) -> Bool in
            v1.date.compare(v2.date) == NSComparisonResult.OrderedDescending
        }
    }
}