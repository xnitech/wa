//
//  ServicesViewController.swift
//  WorshipAnywhere
//
//  Created by Mark Gruetzner on 12/31/15.
//  Copyright © 2015 XNI Technologies, LLC. All rights reserved.
//

import UIKit

class ServicesViewController: UIViewController {

    var vc = VideoController()
    var baseUrl = "http://www.stpaulserbin.org/media/videos/"
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getVideos(completion: (error: NSError?) ->Void) ->Void
    {
        self.vc.loadVideos (self.getVideoType(), completion: { (error) -> Void in
            dispatch_async(dispatch_get_main_queue(),{
                if (error != nil) {
                    let alert = UIAlertController(title: "Unable to load videos", message: "Make sure you have an Internet connection and choose OK to try again.", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
                        self.getVideos({ (error) -> Void in
                        })
                    }))
                    self.presentViewController(alert, animated: true, completion: nil)
                }
                else {
                    completion(error: nil)
                }
            })
        })
    }
    
    func getVideoType() ->String
    {
        if (self.isKindOfClass(SpecialServicesViewController))
        {
            return "special"
        }
        else if (self.isKindOfClass(WorshipServicesViewController))
        {
            return "worship"
        }
        else {
            return ""
        }
    }
    
    func getVideoCount() -> Int
    {
        return self.vc.count()
    }
    
    func playVideo(index: Int) -> Void
    {
        if (index < self.getVideoCount())
        {
            let playerVC = PlayerViewController()
            self.presentViewController(playerVC, animated: true, completion: { () -> Void in
                let videoUrlString = self.baseUrl + self.vc.videos[index].path + "/" + self.vc.videos[index].file
                playerVC.playVideo(videoUrlString)
            })
        }
    }
    
    func populateVideoThumbnailCellAtIndex(cell: VideoThumbnailCell, index: Int, completion: () -> Void) -> Void
    {
        if (index >= self.getVideoCount()) {
            completion()
        }
        
        let imageTitle = self.vc.videos[index].desc
        cell.thumbnailLabel.text = imageTitle
        
        let imageUrlString = self.baseUrl + self.vc.videos[index].path + "/" + self.vc.videos[index].thumb
        let imageUrl = NSURL(string: imageUrlString)
        getDataFromUrl(imageUrl!) { (data, response, error)  in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                cell.thumbnailImage.contentMode = .ScaleAspectFit
                cell.thumbnailImage.image = UIImage(data: data)
                completion()
            }
        }
    }
    
    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
            }.resume()
    }
}
