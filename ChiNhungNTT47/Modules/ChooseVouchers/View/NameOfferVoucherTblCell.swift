//
//  NameOfferTblCell.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 8/7/23.
//

import UIKit

class NameOfferVoucherTblCell: UITableViewHeaderFooterView {
    @IBOutlet weak var titile: UILabel!
    @IBOutlet weak var descriptionC: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUpui(title: String, descriptionV: String){
        titile.text = title
        descriptionC.text = descriptionV
    }
    
}
