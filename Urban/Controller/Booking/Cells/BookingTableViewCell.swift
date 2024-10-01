//
//  BookingTableViewCell.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/29/24.
//

import UIKit

class BookingTableViewCell: UITableViewCell {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var modifyButton: UIButton!
    @IBOutlet weak var reviewsButton: UIButton!
    @IBOutlet weak var modifyView: UIView!
    @IBOutlet weak var reviewView: UIView!
    @IBOutlet weak var supportButton: UIButton!
    @IBOutlet weak var reinitiateButton: UIButton!
    @IBOutlet weak var trackButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
