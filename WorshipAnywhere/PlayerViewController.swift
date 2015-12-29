//
//  PlayerViewController.swift
//  WorshipAnywhere
//
//  Created by Mark Gruetzner on 12/28/15.
//  Copyright © 2015 XNI Technologies, LLC. All rights reserved.
//

import Foundation
import UIKit
import AVKit

var player = AVPlayer()

class PlayerViewController: AVPlayerViewController, AVPlayerViewControllerDelegate {
   
   override func viewDidLoad() {
      super.viewDidLoad()
   }
   
   deinit {
      if (self.player != nil) {
         self.player!.removeObserver(self, forKeyPath: "status")
      }
   }
   
   /*
   func loadItem(urlString: String, completion: (result: AVPlayerItem) -> Void)
   {
      let url = NSURL(fileURLWithPath: urlString)
      let item = AVPlayerItem(URL: url)
      
      self.player = AVPlayer(URL: url)
      self.player!.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions(), context: nil)
      completion(result: item);
   }
   */
   
   func playVideo()
   {
      if (self.player != nil) {
         //self.player!.removeObserver(self, forKeyPath: "status")
      }
      //player = AVPlayer(URL: NSURL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!)
      
      //var url = NSURL(fileURLWithPath: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
      //if let player = AVPlayer(URL: url) {
       //  playerViewController.player = player
      //}
      //self.player = AVPlayer(URL: NSURL(string: "http://www.stpaulserbin.org/media/videos/SerbinChurch_12_20_2015/VTS_01_1.mp4")!)
      
      //let url = "http://www.stpaulserbin.org/media/videos/SerbinChurch_12_20_2015/VTS_01_1.mp4"
      //let url = "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
      
      //let url = NSURL(fileURLWithPath: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")

            //self.player = AVPlayer(URL: NSURL(fileURLWithPath: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"))
            //self.player!.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions(), context: nil)
            //self.player?.play()
      
      self.player = AVPlayer(URL: NSURL(string: "http://www.stpaulserbin.org/media/videos/SerbinChurch_12_20_2015/VTS_01_1.mp4")!)
      self.player!.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions(), context: nil)
      
      //self.player?.play()

   }
   
   override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>)
   {
      if (keyPath! == "status") {
         if (player!.status == AVPlayerStatus.ReadyToPlay) {
            print("ready")
            dispatch_async(dispatch_get_main_queue(),{
               //self.player = AVPlayer(playerItem: result)
               //self.player!.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions(), context: nil)
               self.player?.play()
            })

         }
         else if (player!.status == AVPlayerStatus.Failed) {
            print("failed")
         }
      }
   }
   
}