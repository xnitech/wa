//
//  SpecialServicesViewController.swift
//  WorshipAnywhere
//
//  Created by Mark Gruetzner on 12/30/15.
//  Copyright © 2015 XNI Technologies, LLC. All rights reserved.
//

import UIKit

class SpecialServicesViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIScrollViewDelegate {
   
   var vc = VideoController()
   var baseUrl = "http://www.stpaulserbin.org/media/videos/"
   
   @IBOutlet var scrollView : UIScrollView!
   @IBOutlet var collectionView : UICollectionView!
   let reuseIdentifierFeatured = "VideoThumbnailCellForSpecialServices"
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.collectionView.delegate = self;
      self.collectionView.dataSource = self;
      // Do any additional setup after loading the view.
   }
   
   override func viewDidAppear(animated: Bool) {
      super.viewDidAppear(animated)
      self.getVideos()
   }
   
   override func viewDidLayoutSubviews() {
      self.scrollView!.contentSize = CGSizeMake(1920, 2200)
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   // Collection View Methods
   
   func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
      return 50
   }
   
   func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
      return 50
   }
   
   func collectionView(collectionView: UICollectionView,
      layout collectionViewLayout: UICollectionViewLayout,
      insetForSectionAtIndex section: Int) -> UIEdgeInsets {
         return UIEdgeInsets(top: 0.0, left: 50.0, bottom: 0.0, right: 50.0)
   }
   
   func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
      return 1
   }
   
   func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
   {
      if (collectionView == self.collectionView)
      {
         return self.vc.specialVideos.count
      }
      
      return 0
   }
   
   func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      
      if (collectionView == self.collectionView)
      {
         if (indexPath.row >= self.vc.specialVideos.count) {
            return UICollectionViewCell()
         }
         let cell : VideoThumbnailCell = collectionView.dequeueReusableCellWithReuseIdentifier(self.reuseIdentifierFeatured, forIndexPath: indexPath) as! VideoThumbnailCell
         
         let imageUrlString = self.baseUrl + self.vc.specialVideos[indexPath.row].path + "/" + self.vc.specialVideos[indexPath.row].thumb
         let imageUrl = NSURL(string: imageUrlString)
         
         if let data = NSData(contentsOfURL: imageUrl!), let image = UIImage(data: data) {
            cell.thumbnailImage.contentMode = .ScaleAspectFit
            cell.thumbnailImage.image = image
         }
         
         let imageTitle = self.vc.specialVideos[indexPath.row].desc
         cell.thumbnailLabel.text = imageTitle
         
         return cell
      }
      
      return UICollectionViewCell()
   }
   
   func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
   {
      let playerVC = PlayerViewController()
      self.presentViewController(playerVC, animated: true, completion: { () -> Void in
         let videoUrlString = self.baseUrl + self.vc.specialVideos[indexPath.row].path + "/" + self.vc.specialVideos[indexPath.row].file
         playerVC.playVideo(videoUrlString)
      })
   }
   
   func getVideos()
   {
      self.vc.loadVideos { (error) -> Void in
         dispatch_async(dispatch_get_main_queue(),{
            if (error != nil) {
               let alert = UIAlertController(title: "Unable to load videos", message: "Make sure you have an Internet connection and choose OK to try again.", preferredStyle: UIAlertControllerStyle.Alert)
               
               alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
                  self.getVideos()
               }))
               self.presentViewController(alert, animated: true, completion: nil)
            }
            else {
               self.collectionView.reloadData()
            }
         })
      }
   }
}
