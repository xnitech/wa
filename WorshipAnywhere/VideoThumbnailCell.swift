//
//  VideoThumbnailCell.swift
//  WorshipAnywhere
//
//  Created by rw3 on 12/29/15.
//  Copyright © 2015 XNI Technologies, LLC. All rights reserved.
//

import UIKit

class VideoThumbnailCell: UICollectionViewCell {
   
   @IBOutlet weak var thumbnailImage: UIImageView!
   @IBOutlet weak var thumbnailLabel: UILabel!
   
   override init(frame: CGRect)
   {
      super.init(frame: frame)
      self.commonInit()
   }
   
   required init?(coder aDecoder: NSCoder)
   {
      super.init(coder: aDecoder)
   }
   
   private func commonInit()
   {
      // Initialization code
      
      self.layoutIfNeeded()
      self.layoutSubviews()
      self.setNeedsDisplay()
   }
   
   override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
      if (self.focused)
      {
         self.thumbnailImage.adjustsImageWhenAncestorFocused = true
         self.thumbnailLabel.hidden = false
      }
      else
      {
         self.thumbnailImage.adjustsImageWhenAncestorFocused = false
         self.thumbnailLabel.hidden = false
      }
   }
   
   override func layoutSubviews()
   {
      super.layoutSubviews()
   }
   
   override func awakeFromNib() {
      super.awakeFromNib()
   }
   
   override func prepareForReuse() {
      super.prepareForReuse()
   }
}
