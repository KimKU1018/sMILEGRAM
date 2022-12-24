//
//  PostCollectionViewCell.swift
//  sMILEGRAM
//
//  Created by KU Kim on 2022/12/28.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PostCollectionViewCell"

    @IBOutlet weak var postImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupData(){
        
    }

}
