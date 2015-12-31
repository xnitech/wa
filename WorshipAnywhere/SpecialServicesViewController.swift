//
//  SpecialServicesViewController.swift
//  WorshipAnywhere
//
//  Created by Mark Gruetzner on 12/30/15.
//  Copyright © 2015 XNI Technologies, LLC. All rights reserved.
//

import UIKit

class SpecialServicesViewController: ServicesViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIScrollViewDelegate {
   
   @IBOutlet var scrollView : UIScrollView!
   @IBOutlet var collectionView : UICollectionView!
   let reuseIdentifierFeatured = "VideoThumbnailCellForSpecialServices"
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.collectionView.delegate = self;
      self.collectionView.dataSource = self;
      // Do any additional setup after loading the view.
   }
   
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        self.getVideos { (error) -> Void in
            if (error == nil) {
                self.collectionView.reloadData()
            }
        }
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
            return self.getVideoCount()
        }
      
        return 0
    }
   
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      
        if (collectionView == self.collectionView)
        {
            let cell : VideoThumbnailCell = collectionView.dequeueReusableCellWithReuseIdentifier(self.reuseIdentifierFeatured, forIndexPath: indexPath) as! VideoThumbnailCell
            self.populateVideoThumbnailCellAtIndex(cell, index: indexPath.row, completion: {})
            return cell
        }
      
        return UICollectionViewCell()
    }
   
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        self.playVideo(indexPath.row)
    }
}
