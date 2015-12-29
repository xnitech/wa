//
//  ViewController.swift
//  WorshipAnywhere
//
//  Created by Mark Gruetzner on 12/28/15.
//  Copyright © 2015 XNI Technologies, LLC. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      
      //let player = AVPlayer(URL: NSURL(string: "http://www.stpaulserbin.org/media/videos/SerbinChurch_12_20_2015/VTS_01_1.mp4")!)
      //player.play()
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   @IBAction func playVideo(sender: AnyObject)
   {
      let playerVC = PlayerViewController()
      playerVC.playVideo()
      [self.presentViewController(playerVC, animated: true, completion: nil)]
   }

}

