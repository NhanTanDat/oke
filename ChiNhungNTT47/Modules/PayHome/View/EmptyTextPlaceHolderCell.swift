//
//  EmptyTextPlaceHolderCell.swift
//  Payment
//
//  Created by k2 tam on 22/08/2023.
//

import UIKit

class EmptyTextPlaceHolderCell: UITableViewCell {
    static let identifier = "EmptyTextPlaceHolderCellID"

    private let textPlaceHolderView: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.54, green: 0.54, blue: 0.54, alpha: 1)
        
        return label
    }()
    
    func configure(placeHolderText: String){
        textPlaceHolderView.text = placeHolderText
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           setupUI()
       }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
           setupUI()
       }
    
    private func setupUI() {
        contentView.addSubview(textPlaceHolderView)
        
        NSLayoutConstraint.activate([
            textPlaceHolderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            textPlaceHolderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textPlaceHolderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textPlaceHolderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
