//
//  SeeMoreVoucherTbl.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 8/7/23.
//

import UIKit

class SeeMoreVoucherTbl: UITableViewHeaderFooterView {
    var callbackSeeMore: (() -> Void)?
    @IBOutlet weak var textFooter: UILabel!
    @IBOutlet weak var imageFooter: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.isUserInteractionEnabled = true
        self.contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapSeeMore)))
    }
    func setUpUi(text: String,image: UIImage){
        textFooter.text = text
        imageFooter.image = image
       
    }
    @objc func tapSeeMore(_ tap: UITapGestureRecognizer){
        callbackSeeMore?()
    }
    
}
