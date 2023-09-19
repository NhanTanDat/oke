//
//  BillCategoryModel.swift
//  Payment
//
//  Created by k2 tam on 22/08/2023.
//

import Foundation
import SwiftyJSON

struct BillCategoriesModel {
    let statusCode: Int
    let message: String
    let data: BillCategoryDataModel
    
    init(json: JSON){
        self.statusCode = json["statusCode"].intValue
        self.message = json["message"].stringValue
        self.data = BillCategoryDataModel(json: json["data"])
    }
}

struct BillCategoryDataModel {
    let total: Int
    let iconsPerRow: Int
    let items: [BillCategoryItemModel]
    
    init(json: JSON){
        self.total = json["total"].intValue
        self.iconsPerRow = json["iconsPerRow"].intValue
        self.items = json["items"].arrayValue.map{
            return BillCategoryItemModel(json: $0)
        }
    }
}

struct BillCategoryItemModel {
    let title: String
    let actionType: String
    let dataAction: String
    let iconUrl: String
    let data: BillCategoryItemDataModel
    
    init(json: JSON){
        self.title = json["title"].stringValue
        self.actionType = json["actionType"].stringValue
        self.dataAction = json["dataAction"].stringValue
        self.iconUrl = json["iconUrl"].stringValue
        self.data = BillCategoryItemDataModel(json: json["data"])
        
    }
}

struct BillCategoryItemDataModel {
    let id: Int
    let name: String
    
    init(json: JSON){
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
    }
}
