//
//  VoucherModel.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 8/4/23.
//

import Foundation
import SwiftyJSON

struct ChooseVoucherModel{
    var serviceList: [ServiceVoucher]
    init(serviceList: [ServiceVoucher]){
        self.serviceList = serviceList
    }
    init(json: JSON){
        self.serviceList = json["serviceList"].arrayValue.map({ return ServiceVoucher(json: $0)})
    }
}
struct ServiceVoucher{
    var titleService: String
    var isExpanded: Bool = false
    var descriptionService: String
    var multiSelexted: Bool
    var listVouchers: [VoucherItem]
    init(titleService: String, descriptionService: String, multiSelexted: Bool, listVouchers: [VoucherItem]) {
        self.titleService = titleService
        self.descriptionService = descriptionService
        self.multiSelexted = multiSelexted
        self.listVouchers = listVouchers
    }
    init(json: JSON){
        self.titleService = json["titleService"].stringValue
        self.descriptionService = json["descriptionService"].stringValue
        self.multiSelexted = json["multiSelexted"].boolValue
        self.listVouchers = json["listVouchers"].arrayValue.map({ return VoucherItem(json: $0)})
    }
}
struct VoucherItem{
    var idVoucher : String
    var isCheck: Bool = false
    var type_voucher: String
    var titleVoucher: String
    var descriptionVouchers: String
    var expires: String
    var obligatory: Bool
    var activated: Bool
    init(idVoucher : String, type_voucher: String, titleVoucher: String, descriptionVouchers: String, expires: String, obligatory: Bool, activated: Bool) {
        self.idVoucher = idVoucher
        self.type_voucher = type_voucher
        self.titleVoucher = titleVoucher
        self.descriptionVouchers = descriptionVouchers
        self.expires = expires
        self.obligatory = obligatory
        self.activated = activated
    }
    init(json: JSON){
        self.idVoucher = json["idVoucher"].stringValue
        self.type_voucher = json["type_voucher"].stringValue
        self.titleVoucher = json["titleVoucher"].stringValue
        self.descriptionVouchers = json["descriptionVouchers"].stringValue
        self.expires = json["expires"].stringValue
        self.obligatory = json["obligatory"].boolValue
        self.activated = json["activated"].boolValue
    }
}
