//
//  ActionAlertTbl.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 9/19/23.
//

import UIKit

class ActionAlertTbl: UITableViewCell {
    let lineHeight: CGFloat = 19
    @IBOutlet weak var label: UILabel!
    let texta = "FPT Telecom khuyến cáo, chúng tôi không khuyến khích Khách hàng bật tính năng Chặn truy cập quyền riêng tư. Chúng tôi sử dụng dữ liệu để tối ưu hoá hiệu suất sử dụng Internet.\n Khi bật cài đặt này, Quý khách chỉ sử dụng được những tính năng cơ bản như Khởi động lại Modem, Bật/Tắt Wi-Fi, Đặt lịch. Không sử dụng được những tính năng nâng cao như Quản lý truy cập, Mô hình mạng..."
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    func setUpUI(){
        
        let boldText = "Chặn truy cập quyền riêng tư"
        let boldRange = (texta as NSString).range(of: boldText)
        let font = UIFont.boldSystemFont(ofSize: 12) // Font in đậm
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeight / label.font.lineHeight
        let attributedText = NSMutableAttributedString(string: texta,attributes: [
            .paragraphStyle: paragraphStyle
        ])

        attributedText.addAttributes([
            .font: font
        ], range: boldRange)

        label.attributedText = attributedText
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
