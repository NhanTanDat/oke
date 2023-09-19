//
//  OtherBillCell.swift
//  Payment
//
//  Created by k2 tam on 21/08/2023.
//

import UIKit
import Kingfisher

class BillCategoryCell: UITableViewCell {
    static let identifier = "BillCategoryCellID"
    
    static func nib() -> UINib {
        return UINib(nibName: "BillCategoryCell", bundle: nil)
    }
    
    var billCategoriesData: BillCategoryDataModel? {
        didSet {
            setupThumbs()
        }
    }
    
    var itemForThumb1: BillCategoryItemModel?
    var itemForThumb2: BillCategoryItemModel?
    var itemForThumb3: BillCategoryItemModel?

    
    @IBOutlet weak var billThumb1: UIImageView!
    @IBOutlet weak var billThumb2: UIImageView!
    @IBOutlet weak var billThumb3: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        billThumb1.layer.cornerRadius = 10
        billThumb2.layer.cornerRadius = 10
        billThumb3.layer.cornerRadius = 10
        
        billThumb1.clipsToBounds = true
        billThumb2.clipsToBounds = true
        billThumb3.clipsToBounds = true

    }
    
    private func setupThumbs() {
        guard let billCategoriesData = billCategoriesData else {return}
        
        itemForThumb1 = billCategoriesData.items.first(where: { billCategoryItem in
            billCategoryItem.title == "Nạp tiền\nđiện thoại"

        })
       
        itemForThumb2 = billCategoriesData.items.first(where: { billCategoryItem in
            billCategoryItem.title == "Nước"

        })
        
        itemForThumb3 = billCategoriesData.items.first(where: { billCategoryItem in
            billCategoryItem.title == "Điện"

        })
        
        guard let itemForThumb1 = itemForThumb1, let itemForThumb2 = itemForThumb2, let itemForThumb3 = itemForThumb3 else {return }
        
        
        guard
            let thumb1Url = URL(string: itemForThumb1.iconUrl),
            let thumb2Url = URL(string: itemForThumb2.iconUrl),
            let thumb3Url = URL(string: itemForThumb3.iconUrl)
         else {
            return
            
        }
        
        billThumb1.kf.setImage(with: thumb1Url)
        billThumb2.kf.setImage(with: thumb2Url)
        billThumb3.kf.setImage(with: thumb3Url)

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
