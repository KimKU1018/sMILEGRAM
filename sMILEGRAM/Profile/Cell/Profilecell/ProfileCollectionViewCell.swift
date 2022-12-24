//
//  ProfileCollectionViewCell.swift
//  sMILEGRAM
//
//  Created by KU Kim on 2022/12/20.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProfileCollectionViewCell"

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var addProfileImageView: UIImageView!
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var addFriendButton: UIButton!
    
    @IBOutlet weak var postingCountLable: UILabel!
    
    @IBOutlet weak var followerCountLable: UILabel!
    
    @IBOutlet weak var followingCountLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
    }
    
    private func setupAttribute(){
        profileImageView.layer.cornerRadius = 88 / 2
        addProfileImageView.layer.cornerRadius = 24 / 2
        
        profileImageView.layer.borderColor = UIColor.darkGray.cgColor
        profileImageView.layer.borderWidth = 1
        
        editButton.layer.cornerRadius = 5
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        editButton.layer.borderWidth = 1
        
        addFriendButton.layer.cornerRadius = 3
        addFriendButton.layer.borderColor = UIColor.lightGray.cgColor
        addFriendButton.layer.borderWidth = 1
        
        [postingCountLable, followerCountLable, followingCountLable].forEach{$0?.text = "\(Int.random(in: 0...10))"}
        
    }

}
