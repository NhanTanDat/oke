//
//  PayTblCell.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 8/24/23.
//

import UIKit

class PayTblCell: UITableViewCell {
    @IBOutlet weak var viewContent: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewContent.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
