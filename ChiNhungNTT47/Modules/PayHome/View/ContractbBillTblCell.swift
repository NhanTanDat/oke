//
//  ItemBillTblCell.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 8/21/23.
//

import UIKit

class ContractbBillTblCell: UITableViewCell {
    @IBOutlet weak var StackView: UIStackView!
    @IBOutlet weak var viewContentBill: UIView!
    
    @IBOutlet weak var viewLayer: UIView!
    @IBOutlet weak var viewContentContract: UIView!
    var callbackExpand: (() -> Void)?
    @IBOutlet weak var btnExpand: UIButton!
    @IBOutlet weak var nameContract: UILabel!
    @IBOutlet weak var checkContract: UIButton!
    let languages = ["Swift", "Java", "Go"]

    var viewContent: [ItemBillCustomView] = []
    
    
    var isExpand: Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        setView()
        self.viewLayer.layer.cornerRadius = 8
        setUI()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapExpand))
        viewContentContract.isUserInteractionEnabled = true
        viewContentContract.addGestureRecognizer(tap)
        
    }
    @objc
    func tapExpand(sender:UITapGestureRecognizer) {
        expandA()
    }
    func expandA(){
        if self.isExpand == false{
            StackView.removeFullyAllArrangedSubviews()
            self.layoutIfNeeded()
            self.isExpand = true
        }else{
            setUI()
            self.isExpand = false
        }
        self.callbackExpand?()
    }
    func setView(){
        for language in languages {
            let viewNew = ItemBillCustomView()
            if(language == "Java"){
                viewNew.viewEndow.isHidden = true
            }
            viewContent.append(viewNew)
        }
    }
    func setUI(){
        for content in viewContent {
            StackView.addArrangedSubview(content)
        }
    }
    @IBAction func expandBill(_ sender: Any) {
        expandA()
    }
}

extension UIStackView {
    func removeFully(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }
    
    func removeFullyAllArrangedSubviews() {
        arrangedSubviews.forEach { (view) in
            removeFully(view: view)
        }
    }
    
}
