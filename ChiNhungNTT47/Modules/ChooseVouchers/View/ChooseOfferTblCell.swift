//
//  ChooseOfferTblCell.swift
//  Hi Health
//
//  Created by TaiVC on 8/4/23.
//

import UIKit

class ChooseOfferTblCell: UITableViewCell {
    @IBOutlet weak var viewContentVoucher: UIView!
    @IBOutlet weak var radiobuttonChooseVoucher: UIButton!
    @IBOutlet weak var titleVoucher: UILabel!
    @IBOutlet weak var expirationDate: UILabel!
    @IBOutlet weak var descriptionVoucher: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    var callbackCheckVoucher: (() -> Void)?
    var callbackTapOfferDetail: (() -> Void)?
    var isSelectedItem: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpview()
    }

    func setUpview(){
        viewContentVoucher.layer.cornerRadius = 8
        
    }
    func setUpUI(title: String, descriptions: String, expiration_Date: String, isSelected: Bool){
        titleVoucher.text = title
        descriptionVoucher.text = descriptions
        expirationDate.text = expiration_Date
        if isSelected == false{
            radiobuttonChooseVoucher.setImage(UIImage(named: "Group 34430"), for: .normal)
        }else{
            radiobuttonChooseVoucher.setImage(UIImage(named: "Check box"), for: .normal)
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        detail.isUserInteractionEnabled = true
        detail.addGestureRecognizer(tap)
    }
    @objc
      func tapFunction(sender:UITapGestureRecognizer) {
          callbackTapOfferDetail?()
      }
    @IBAction func actionSelectedVoucher(_ sender: Any) {
        callbackCheckVoucher?()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
