//
//  PayHomeVM.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 8/24/23.
//

import Foundation
import UIKit
import Alamofire

protocol PaymentVMDelegate {
    func didGetNewTbvData()
}
enum PaymentSection {
case banner([BannerDataModel])
case BillList(ContractBillModel)
case billCategories(BillCategoryDataModel)
case recentTransactions(TransactionDataModel)
}

class PayHomeVM{
    var delegate: PaymentVMDelegate?
    var paymentTbvData:[PaymentSection] = []
    var bannerData: [BannerDataModel]?
    var billCategoriesData: BillCategoryDataModel?
    var recentTransactionData: TransactionDataModel?
    var bilcontractNo: ContractBillModel?
    var baseCallback :(()->Void)?
    func getNumberSection()-> Int{
        return self.bilcontractNo?.data.listTelecombill.count ?? 0
    }
    func fechData(vc: UIViewController){
        let URL = "https://hifpt-api-stag.fpt.vn/v91/payment-merchant/bills/telecom-bill-home"
        let headers: HTTPHeaders = ["Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJqdGkiOiJiZjMyY2RiMC1jYTE5LTRlN2QtOWIwOS04OTIxNGViMTQ5NmYiLCJpYXQiOjE2OTM4ODU5NDAsImV4cCI6MTY5Mzg4OTUzOX0.95j_TCUCJZ-RgDqN2L-Bhvk38j--3yvRYqwVi2d9RqMW0M5KmUCE2pk_9-deuE4WLRTm0L35uEGdumwQQUH9WQ"]
        APIManager.shared.requestAPI(endPoint: URL, signatureHeader: true, optionalHeaders: headers, vc: vc) { [self] data, error in
            self.bilcontractNo = ContractBillModel(json: data)
            self.baseCallback?()
        }
    }
    private func composeData() {
        var temp: [PaymentSection] = []
        
        if let bannerData = bannerData {
            if bannerData.isEmpty {
                return
            }
            temp.append(.banner(bannerData))
        }
        if let bilcontractNo = bilcontractNo {
            temp.append(.BillList(bilcontractNo))
        }
        if let billCategoriesData = billCategoriesData {
            temp.append(.billCategories(billCategoriesData))
        }
        
        if let recentTransactionData = recentTransactionData {
            temp.append(.recentTransactions(recentTransactionData))
        }
       
        self.paymentTbvData = temp
        
        ///Redload payment tbv data
        delegate?.didGetNewTbvData()

    }
    
  
    
    func fetchPaymentTblData() {
        PaymetManager.shared.calllistbillAPI { [weak self] bilcontractNo in
            guard let self = self else { return }
            self.bilcontractNo = bilcontractNo
            self.composeData()
           
        }
        PaymetManager.shared.callBannerAPI { [weak self] bannerData in
            guard let self = self else { return }
            self.bannerData = bannerData
            self.composeData()
        }
        
        PaymetManager.shared.callTransactionAPI { [weak self] recentTransactionData in
            guard let self = self else { return }
            self.recentTransactionData = recentTransactionData
            self.composeData()
        }
        
        PaymetManager.shared.callBillCategoryAPI { [weak self] billCategoriesData in
            guard let self = self else { return }
            self.billCategoriesData = billCategoriesData
            self.composeData()
           
        }
       
    }
}
