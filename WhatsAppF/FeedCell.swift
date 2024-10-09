//
//  FeedCell.swift
//  WhatsAppF
//
//  Created by Ömer on 9.10.2024.
//

import UIKit

class FeedCell: UITableViewCell {
    

    @IBOutlet weak var imageViews: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var userName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
