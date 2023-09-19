//
//  ContractBillModel.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 8/24/23.
//

import Foundation
import SwiftyJSON

struct ContractBillModel{
    var statusCode: Int
    var message: String
    var data: DataBill
    init(statusCode: Int, message: String, data: DataBill) {
        self.statusCode = statusCode
        self.message = message
        self.data = data
       
    }
    init(json: JSON!){
        self.statusCode = json["statusCode"].intValue
        self.message = json["message"].stringValue
        self.data = DataBill(json: json["data"])
     
    }
}
struct DataBill{
    var contents: Contents
    var listTelecombill: [contractBillItem]
    var screenType: String
    var activityFlow: String
    init(contents: Contents,listTelecombill: [contractBillItem], screenType: String, activityFlow: String) {
        self.contents = contents
        self.listTelecombill = listTelecombill
        self.screenType = screenType
        self.activityFlow = activityFlow
    }
    init(json: JSON!){
        self.contents = Contents(json: json["contents"])
        self.listTelecombill = json["listTelecombill"].arrayValue.map({ return contractBillItem(json: $0)})
        self.screenType = json["screenType"].stringValue
        self.activityFlow = json["activityFlow"].stringValue
    }
}
struct Contents{
    let textNoBill: String
    init(textNoBill: String) {
        self.textNoBill = textNoBill
    }
    init(json: JSON!){
        self.textNoBill = json["textNoBill"].stringValue
    }
}
struct contractBillItem{
    var contractTypeName: String
    var title: String
    var contractNo: String
    var iconUrl: String
    var listBill: [BillItem]
    init(contractTypeName: String, title: String, contractNo: String, iconUrl: String, listBill: [BillItem]) {
        self.contractTypeName = contractTypeName
        self.title = title
        self.contractNo = contractNo
        self.iconUrl = iconUrl
        self.listBill = listBill
    }
    init(json: JSON!){
        self.contractTypeName = json["contractTypeName"].stringValue
        self.title = json["title"].stringValue
        self.contractNo = json["contractNo"].stringValue
        self.iconUrl = json["iconUrl"].stringValue
        self.listBill = json["listBill"].arrayValue.map({ return BillItem(json: $0 )})
    }
}
struct BillItem{
    var titleBill: String
    var contentBill: String
    var total: Double
    var totalText: String
    var billNumber: String
    var type: String
    var receiptType: Int
    var allowDelete: Bool
    var allowUpdated: Bool
    var checkedGroup: Bool
    var evcCode: String
    var evcTitle: String
    var evcAmount: Int
    var evcAmountText: String
    var evcType: String
    init(titleBill: String, contentBill: String, total: Double, totalText: String, billNumber: String, type: String, receiptType: Int, allowDelete: Bool, allowUpdated: Bool, checkedGroup: Bool, evcCode: String, evcTitle: String, evcAmount: Int, evcAmountText: String, evcType: String) {
        self.titleBill = titleBill
        self.contentBill = contentBill
        self.total = total
        self.totalText = totalText
        self.billNumber = billNumber
        self.type = type
        self.receiptType = receiptType
        self.allowDelete = allowDelete
        self.allowUpdated = allowUpdated
        self.checkedGroup = checkedGroup
        self.evcCode = evcCode
        self.evcTitle = evcTitle
        self.evcAmount = evcAmount
        self.evcAmountText = evcAmountText
        self.evcType = evcType
    }
    init(json: JSON!){
        self.titleBill = json["titleBill"].stringValue
        self.contentBill = json["contentBill"].stringValue
        self.total =  json["total"].doubleValue
        self.totalText =  json["totalText"].stringValue
        self.billNumber =  json["billNumber"].stringValue
        self.type =  json["type"].stringValue
        self.receiptType =  json["receiptType"].intValue
        self.allowDelete =  json["allowDelete"].boolValue
        self.allowUpdated =  json["allowUpdated"].boolValue
        self.checkedGroup = json["checkedGroup"].boolValue
        self.evcCode = json["evcCode"].stringValue
        self.evcTitle = json["evcTitle"].stringValue
        self.evcAmount = json["evcAmount"].intValue
        self.evcAmountText = json["evcAmountText"].stringValue
        self.evcType = json["evcType"].stringValue
    }
}
