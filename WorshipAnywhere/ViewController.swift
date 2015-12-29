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

   var player = AVPlayer()
   
   override func viewDidLoad() {
      super.viewDidLoad()
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   @IBAction func playVideo(sender: AnyObject)
   {
      let playerVC = PlayerViewController()
      self.presentViewController(playerVC, animated: true) {
         playerVC.playVideo()
      }
   }

}

