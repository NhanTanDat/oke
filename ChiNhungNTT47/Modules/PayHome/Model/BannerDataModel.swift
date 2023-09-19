//
//  BannerModel.swift
//  Payment
//
//  Created by k2 tam on 22/08/2023.
//

import Foundation
import SwiftyJSON

struct BannerModel {
    let statusCode: Int
    let message: String
    let data: [BannerDataModel]
    
    init(json: JSON){
        self.statusCode = json["statusCode"].intValue
        self.message = json["message"].stringValue
        self.data = json["data"].arrayValue.map{
            return BannerDataModel(json: $0)
        }
    }
}

struct BannerDataModel {
    let id: Int
    let imageUrl: String
    let action: BannerActionModel
    
    init(json: JSON){
        self.id = json["id"].intValue
        self.imageUrl = json["imageUrl"].stringValue
        self.action = BannerActionModel(json: json["action"])
    }
}

struct BannerActionModel {
    let dataAction: String
    let actionType: String
    let actionData: String
    
    init(json: JSON){
        self.dataAction = json["dataAction"].stringValue
        self.actionType = json["actionType"].stringValue
        self.actionData = json["actionData"].stringValue
    }
}
