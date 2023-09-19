//
//  HeaderSectionView.swift
//  Payment
//
//  Created by k2 tam on 21/08/2023.
//

import UIKit

class HeaderSectionView: UITableViewHeaderFooterView {
    static let identifier = "headerSectionViewID"
    
    static func nib() -> UINib {
        return UINib(nibName: "HeaderSectionView", bundle: nil)
    }

    @IBOutlet weak var leadingLabel: UILabel!
    @IBOutlet weak var trailingLabel: UILabel!
    
    func configure(leadingLabel: String, trailingLabel: String? = "Xem tất cả") {
        self.leadingLabel.text = leadingLabel
        self.trailingLabel.text = trailingLabel
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
}
