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

   func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
   {
      let playerVC = PlayerViewController()
      self.presentViewController(playerVC, animated: true, completion: { () -> Void in
         playerVC.playVideo()
      })
   }
   
   func getVideos()
   {
      let postEndpoint: String = "http://www.stpaulserbin.org/stpaulserbin/videos.php"
      guard let url = NSURL(string: postEndpoint) else {
         print("Error: cannot create URL")
         return
      }
      let urlRequest = NSURLRequest(URL: url)
      let config = NSURLSessionConfiguration.defaultSessionConfiguration()
      let session = NSURLSession(configuration: config)
      let task = session.dataTaskWithRequest(urlRequest, completionHandler: {
         (data, response, error) in
         guard let responseData = data else {
            print("Error: did not receive data")
            return
         }
         guard error == nil else {
            print("error calling videos.php")
            print(error)
            return
         }
         // parse the result as JSON, since that's what the API provides
         let post: NSArray
         do {
            post = try NSJSONSerialization.JSONObjectWithData(responseData,
               options: []) as! NSArray
         } catch  {
            print("error trying to convert data to JSON")
            return
         }
         
         for element in post {
            let path = element["video_path"] as! String
            if let desc = element["video_description"] as? String {
               print(desc)
            }
            print(path)
            //print(desc)
         }
         
         //_ = post["title"]
         
         /*
         // now we have the post, let's just print it to prove we can access it
         print("The post is: " + post.description)
         
         // the post object is a dictionary
         // so we just access the title using the "title" key
         // so check for a title and print it if we have one
         if let postTitle = post["title"] as? String {
            print("The title is: " + postTitle)
         }
         */
      })
      task.resume()
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
