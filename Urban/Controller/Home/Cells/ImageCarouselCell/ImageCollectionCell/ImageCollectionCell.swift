//
//  ImageCollectionCell.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/27/24.
//

import UIKit

class ImageCollectionCell: UICollectionViewCell {

    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet weak var heartImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var shouldHideHeart : Bool = false{
        didSet{
            heartImage.isHidden = shouldHideHeart
        }
    }
}
