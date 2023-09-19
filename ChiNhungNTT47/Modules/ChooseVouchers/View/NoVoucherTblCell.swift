//
//  NoVoucherTblCell.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 8/14/23.
//

import UIKit

class NoVoucherTblCell: UITableViewCell {
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var nameOffer: UILabel!
    @IBOutlet weak var descriptionOffer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
