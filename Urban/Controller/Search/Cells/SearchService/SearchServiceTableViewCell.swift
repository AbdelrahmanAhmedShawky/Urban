//
//  SearchServiceTableViewCell.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/31/24.
//

import UIKit

class SearchServiceTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet var categoryImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
