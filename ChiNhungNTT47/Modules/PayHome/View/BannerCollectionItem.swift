//
//  BannerCollectionCell.swift
//  Payment
//
//  Created by k2 tam on 20/08/2023.
//

import UIKit

class BannerCollectionItem: UICollectionViewCell {
    
    static let identifier = "BannerCollectionItemID"
    
    static func nib() -> UINib {
        return UINib(nibName: "BannerCollectionItem", bundle: nil)
    }

    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    

}
