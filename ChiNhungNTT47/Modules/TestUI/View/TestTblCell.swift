//
//  TestTblCell.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 9/15/23.
//

import UIKit

class TestTblCell: UITableViewCell {
    @IBOutlet weak var itemScroll: UIScrollView!
    var callbacktapiteam:  (()->Int)?
    @IBOutlet weak var itemStack: UIStackView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addStackSctrollVew()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    let x = [0,1,2,3,4,5,6,7,8,9,10]
    
    @objc func buttonAction(sender: UIButton!, id: Int) {
        let index = sender.tag
        print(index)
    }
    func addStackSctrollVew(){
        itemStack.spacing = 8
        itemStack.axis = .horizontal
        itemScroll.showsHorizontalScrollIndicator = false

        self.x.forEach { iteam in
            let iteamView = UIButton()
            itemStack.addArrangedSubview(iteamView)

            iteamView.addTarget(self, action: #selector(buttonAction(sender:id:)), for: .touchUpInside)
            if(iteam == 1 ){
                NSLayoutConstraint.activate([
                    iteamView.widthAnchor.constraint(equalToConstant: 18)
                ])
            }else{
                NSLayoutConstraint.activate([
                    iteamView.widthAnchor.constraint(equalToConstant: 24)
                ])
            }
            iteamView.backgroundColor = .black
            if let idx = itemStack.arrangedSubviews.firstIndex(of: iteamView){
                iteamView.tag = idx
            }
           
        }
    }
}
