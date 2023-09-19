//
//  PaymentModel.swift
//  Payment
//
//  Created by k2 tam on 22/08/2023.
//

import Foundation
import SwiftyJSON


struct RecentTransactionsModel {
    let statusCode: Int
    let message: String
    let data: TransactionDataModel
    
    init(json: JSON){
        self.statusCode = json["statusCode"].intValue
        self.message = json["message"].stringValue
        self.data = TransactionDataModel(json: json["data"])
    }
}

struct TransactionDataModel {
    let histories: [TransactionHistoryModel]
    let content: TransactionContentModel
    
    init(json: JSON){
        self.histories = json["histories"].arrayValue.map{
            return TransactionHistoryModel(json: $0)
        }
        self.content = TransactionContentModel(json: json["content"])
    }
}

struct TransactionHistoryModel {
    let title: String
    let transactionTime: String
    let total: Int
    let totalText: String
    let currency: String
    
    init(json: JSON){
        self.title = json["title"].stringValue
        self.transactionTime = json["transactionTime"].stringValue
        self.total = json["total"].intValue
        self.totalText = json["totalText"].stringValue
        self.currency = json["currency"].stringValue
    }
}

struct TransactionContentModel {
    let textNoBill: String
    
    init(json: JSON){
        self.textNoBill = json["textNoBill"].stringValue
    }
}
