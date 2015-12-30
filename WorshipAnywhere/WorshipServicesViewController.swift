//
//  WorshipServicesViewController.swift
//  WorshipAnywhere
//
//  Created by Mark Gruetzner on 12/30/15.
//  Copyright © 2015 XNI Technologies, LLC. All rights reserved.
//

import UIKit

class WorshipServicesViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIScrollViewDelegate {

   @IBOutlet var scrollView : UIScrollView!
   @IBOutlet var collectionView : UICollectionView!
   let reuseIdentifierFeatured = "VideoThumbnailCellForWorshipServices"
   
   override func viewDidLoad() {
      super.viewDidLoad()

      self.collectionView.delegate = self;
      self.collectionView.dataSource = self;
      // Do any additional setup after loading the view.
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
         return 8
      }
      
      return 0
   }
   
   func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      
      if (collectionView == self.collectionView)
      {
         let cell : VideoThumbnailCell = collectionView.dequeueReusableCellWithReuseIdentifier(self.reuseIdentifierFeatured, forIndexPath: indexPath) as! VideoThumbnailCell
         
         let  imageFilename = "VTS_01_1_Thumb.jpg"
         cell.thumbnailImage.image = UIImage(named: imageFilename)
         
         return cell
      }
      
      return UICollectionViewCell()
   }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
