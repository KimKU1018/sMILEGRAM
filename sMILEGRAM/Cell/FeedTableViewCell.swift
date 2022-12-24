//
//  FeedTableViewCell.swift
//  sMILEGRAM
//
//  Created by KU Kim on 2022/12/27.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet var imageViewUserProfile: UIImageView!
    @IBOutlet var labelUserName: UILabel!
    @IBOutlet var imageViewFeed: UIImageView!
    @IBOutlet var buttonIsHeart: NSLayoutConstraint!
    @IBOutlet var buttonIsBookMark: UIButton!
    @IBOutlet var labelHowManyLike: UILabel!
    @IBOutlet var labelFeed: UILabel!
    @IBOutlet var imageViewMyProfile: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageViewUserProfile.layer.cornerRadius = 10.5
        imageViewUserProfile.clipsToBounds = true
        imageViewMyProfile.layer.cornerRadius = 10.5
        imageViewMyProfile.clipsToBounds = true
        
        let fontSize = UIFont.boldSystemFont(ofSize: 9)
        let attributedStr = NSMutableAttributedString(string: labelFeed.text ?? "")
        attributedStr.addAttribute(.font, value: fontSize, range: NSRange.init(location: 0, length: 3))
        
        labelFeed.attributedText = attributedStr
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
