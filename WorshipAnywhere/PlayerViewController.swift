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

//var player = AVPlayer()

class PlayerViewController:  AVPlayerViewController, AVPlayerViewControllerDelegate {
   
   var activityIndicator = UIActivityIndicatorView()
   var container = UIView()
   var loadingView = UIView()
   
   override func viewDidLoad() {
      super.viewDidLoad()
   }

   /*
   override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
      super.pressesBegan(presses, withEvent: event)
   }
   */
   
   deinit {
      if (self.player != nil) {
         //self.player!.removeObserver(self, forKeyPath: "status")
         self.player!.currentItem!.removeObserver(self, forKeyPath: "status")
      }
   }
   
   func playUrl(urlString: String, completion: () ->Void)
   {
      self.player = AVPlayer(URL: NSURL(string: "http://www.stpaulserbin.org/media/videos/SerbinChurch_12_20_2015/VTS_01_1.mp4")!)
      self.player!.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions(), context: nil)
      completion()
   }
   
   
   func loadItem(urlString: String, completion: (result: AVPlayerItem) -> Void)
   {
      let url = NSURL(string: urlString)
      let item = AVPlayerItem(URL: url!)
      completion(result: item);
   }
   
   
   func playVideo()
   {
      if (self.player != nil) {
         self.player!.removeObserver(self, forKeyPath: "status")
      }
      
      //let url = NSURL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
      let url = NSURL(string: "http://www.stpaulserbin.org/media/videos/SerbinChurch_12_20_2015/VTS_01_1.mp4")
      let item = AVPlayerItem(URL: url!)
      self.player = AVPlayer(playerItem: item)
      self.player!.currentItem!.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions(), context: nil)
   
      self.showLoading()
      
      //self.activityIndicator.frame = CGRectMake(0, 0, win.frame.width/5, win.frame.width/5)
      
      
      /*
      self.player = AVPlayer(URL: NSURL(fileURLWithPath: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"))
      //self.player = AVPlayer(URL: NSURL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!)
      self.player?.currentItem?.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions(), context: nil)
      self.player!.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions(), context: nil)
      self.player?.play()
      */
      
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
      
      /*
      loadItem("http://www.stpaulserbin.org/media/videos/SerbinChurch_12_20_2015/VTS_01_1.mp4") { (result) -> Void in
         self.player = AVPlayer(playerItem: result)
         self.player!.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions(), context: nil)
      }
      */
      
      /*
      self.player = AVPlayer(URL: NSURL(string: "http://www.stpaulserbin.org/media/videos/SerbinChurch_12_20_2015/VTS_01_1.mp4")!)
      self.player!.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions(), context: nil)
      */
      
      /*
      let win:UIWindow = UIApplication.sharedApplication().delegate!.window!!
      self.loadingView = UIView(frame: win.frame)
      self.loadingView.tag = 1
      self.loadingView.backgroundColor = UIColor.grayColor()
      win.addSubview(self.loadingView)
      
      container = UIView(frame: CGRect(x: 0, y: 0, width: win.frame.width/3, height: win.frame.width/3))
      container.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.6)
      container.layer.cornerRadius = 10.0
      container.layer.borderColor = UIColor.grayColor().CGColor
      container.layer.borderWidth = 0.5
      container.clipsToBounds = true
      container.center = self.loadingView.center
      
      
      activityIndicator.frame = CGRectMake(0, 0, win.frame.width/5, win.frame.width/5)
      activityIndicator.activityIndicatorViewStyle = .WhiteLarge
      activityIndicator.center = self.loadingView.center
      activityIndicator.userInteractionEnabled = true
      loadingView.userInteractionEnabled = true
      container.userInteractionEnabled = true
      
      self.loadingView.addSubview(container)
      self.loadingView.addSubview(activityIndicator)
      */
      
      //self.dismissViewControllerAnimated(true, completion: nil)
      //activityIndicator.startAnimating()
      /*
      let button   = UIButton(type: UIButtonType.System) as UIButton
      button.frame = CGRectMake(100, 100, 100, 50)
      button.backgroundColor = UIColor.greenColor()
      button.setTitle("Test Button", forState: UIControlState.Normal)
      button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
      
      self.view.addSubview(button)
      */
   }
   /*
   func buttonAction(sender:UIButton!)
   {
      print("Button tapped")
   }
   */
   
   /*
   func hideLoading(){
      UIView.animateWithDuration(0.0, delay: 1.0, options: .CurveEaseOut, animations: {
         self.container.alpha = 0.0
         self.loadingView.alpha = 0.0
         //self.activityIndicator.stopAnimating()
         }, completion: { finished in
            self.activityIndicator.removeFromSuperview()
            self.container.removeFromSuperview()
            self.loadingView.removeFromSuperview()
            let win:UIWindow = UIApplication.sharedApplication().delegate!.window!!
            let removeView  = win.viewWithTag(1)
            removeView?.removeFromSuperview()
      })
   }
   */
   
   func showLoading()
   {
      self.activityIndicator.activityIndicatorViewStyle = .WhiteLarge
      self.activityIndicator.center = self.view.center
      self.activityIndicator.userInteractionEnabled = false
      self.activityIndicator.startAnimating()
      self.view.addSubview(self.activityIndicator)
   }
   
   func hideLoading()
   {
      self.activityIndicator.userInteractionEnabled = true
      self.activityIndicator.stopAnimating()
      self.activityIndicator.removeFromSuperview()
   }
   
   override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>)
   {
      if (keyPath! == "status") {
         if (player!.currentItem!.status == AVPlayerItemStatus.ReadyToPlay) {
            dispatch_async(dispatch_get_main_queue(),{
               self.hideLoading()
               self.player?.play()
            })
         }
         else if (player!.currentItem!.status == AVPlayerItemStatus.Failed) {
            dispatch_async(dispatch_get_main_queue(),{
               self.hideLoading()
               let alert = UIAlertController(title: "Unable to play video", message: "Make sure you have an Internet connection and try again.", preferredStyle: UIAlertControllerStyle.Alert)
               alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
                  switch action.style{
                  case .Default:
                     print("default")
                     self.dismissViewControllerAnimated(true, completion: nil)
                  case .Cancel:
                     print("cancel")
                     
                  case .Destructive:
                     print("destructive")
                  }
               }))
               self.presentViewController(alert, animated: true, completion: nil)
            })
         }
      }
   }
   
}