//
//  StoryCollectionViewCell.swift
//  sMILEGRAM
//
//  Created by KU Kim on 2022/12/27.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewImageViewBackground: UIView!
    
    @IBOutlet weak var viewUserProfileBackground: UIView!
    
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewImageViewBackground.layer.cornerRadius = 24
        viewUserProfileBackground.layer.cornerRadius = 23.5
        imageViewUserProfile.layer.cornerRadius = 22.5
        imageViewUserProfile.clipsToBounds = true
        // Initialization code
    }

}
