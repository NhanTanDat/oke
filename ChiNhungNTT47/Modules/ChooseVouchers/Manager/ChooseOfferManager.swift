//
//  ChooseOfferManager.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 8/17/23.
//

import UIKit

class ChooseOfferManager{
    public static var shared = ChooseOfferManager()
    
    func pushToOfferDetailsVC(vc: UIViewController){
        let ofD = OfferDetailsVC()
        vc.navigationController?.pushViewController(ofD, animated: false)
    }
}
