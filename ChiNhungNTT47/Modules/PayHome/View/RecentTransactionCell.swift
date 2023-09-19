//
//  RecentTransactionCell.swift
//  Payment
//
//  Created by k2 tam on 21/08/2023.
//

import UIKit

class RecentTransactionCell: UITableViewCell {
    static let identifier = "RecentTransactionCellID"
    
    static func nib() -> UINib {
        return UINib(nibName: "RecentTransactionCell", bundle: nil)
    }
    
    var transactionHistoryModel: TransactionHistoryModel? {
        didSet {
            guard let transactionHistoryModel = transactionHistoryModel else {return}
            
            transactionID.text = "SGH123456"
            transactionTitle.text = transactionHistoryModel.title
            transactionTotal.text = formatThousands(transactionHistoryModel.total) ?? ""
            transactionTime.text = transactionHistoryModel.transactionTime
            currencyLabel.attributedText = formatCurrencyCharacterToSuperscriptAndUnderline(transactionHistoryModel.currency)
        }
    }
    
    @IBOutlet weak var transactionID: UILabel!
    @IBOutlet weak var transactionTitle: UILabel!
    @IBOutlet weak var transactionTotal: UILabel!
    @IBOutlet weak var transactionTime: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        contentView.layer.cornerRadius = 8.0
        contentView.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func formatThousands(_ number: Int) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = "."
        numberFormatter.numberStyle = .decimal
        
        if let formattedString = numberFormatter.string(from: NSNumber(value: number)) {
            return formattedString
        }
        
        return nil
    }
    
    func formatCurrencyCharacterToSuperscriptAndUnderline(_ character: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: character)
        
        // Convert to superscript
        let superscriptFont = UIFont.systemFont(ofSize: 9) // Adjust the size for superscript
        let superscriptAttributes: [NSAttributedString.Key: Any] = [
            .font: superscriptFont,
            .baselineOffset: 3 // Adjust the offset for superscript
        ]
        attributedString.addAttributes(superscriptAttributes, range: NSRange(location: 0, length: 1))
        
        // Add underline
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: 1))
        
        return attributedString
    }

    
    
    
}
