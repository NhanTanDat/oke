//
//  ItemBillCustomView.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 8/21/23.
//

import UIKit

class ItemBillCustomView: UIView {
    @IBOutlet var viewcontent: UIView!
    @IBOutlet weak var viewEndow: UIView!
    @IBOutlet weak var viewContentItem: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func setUI(){
        viewContentItem.layer.cornerRadius = 8
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ItemBillCustomView", owner: self, options: nil)
        addSubview(viewcontent)
       
        viewcontent.frame = bounds
        viewcontent.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
