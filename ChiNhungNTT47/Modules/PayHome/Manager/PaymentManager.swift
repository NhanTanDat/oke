//
//  PaymentManager.swift
//  Payment
//
//  Created by k2 tam on 22/08/2023.
//

import Foundation
import Alamofire
import SwiftyJSON

class PaymetManager {
    public static var shared = PaymetManager()
    
    let bannerRawJson: JSON = JSON([
        "statusCode": 0,
        "message": "Thành công",
        "data": [
            [
                "id": 1448,
                "imageUrl": "https://fptcamera.info/wp-content/uploads/sites/16/2021/11/hi-fpt-2048x794.jpg",
                "action": [
                    "dataAction": "LOYALTY_HOME",
                    "actionType": "go_to_screen",
                    "data": nil
                ]
            ] as [String : Any],
            [
                "id": 1449,
                "imageUrl": "https://hi-static.fpt.vn/sys/hifpt/images/events/2023-05-05/8te5YEGBm2jIqSfyZHVZRARK8BIZt1EXisAUQbPz.png",
                "action": [
                    "dataAction": "FOXPAY_HOME",
                    "actionType": "go_to_screen",
                    "data": nil
                ]
            ],
            
            [
                "id": 1449,
                "imageUrl": "https://s3.amazonaws.com/SSL_Assets/apple/iBooks_DIS_Banner_Master_15n.png",
                "action": [
                    "dataAction": "FOXPAY_HOME",
                    "actionType": "go_to_screen",
                    "data": nil
                ]
            ]
        ]
    ] as [String : Any])
    
    let transactionRawJson: JSON  = JSON (
        [
            "statusCode": 0,
            "message": "Thành công",
            "data": [
                "histories": [
                    [
                        "title": "Hóa đơn FPT Telecom",
                        "transactionTime": "04:31 11/07/23",
                        "transactionId": 1,
                        "total": 210900,
                        "totalText": "210900 đ",
                        "currency": "đ"
                    ] as [String : Any]
                ],
                "content": [
                    "textNoBill": "Chưa có hóa đơn điện tử"
                ]
            ] as [String : Any]
        ] as [String : Any]
        
        
    )
    let listbill: JSON = JSON(
        arrayLiteral: [
            "statusCode": 0,
            "message": "Thành công",
            "data": [
                "listTelecombill": [
                    [
                        "contractTypeName": "Chính chủ",
                        "title": "Nguyễn Ngọc Anh - SGH124941",
                        "contractNo": "SGH124941",
                        "iconUrl": "",
                        "listBill":
                            [
                                "titleBill": "Hoá đơn T8/2022",
                                "contentBill": "Khoản thu từ 01/07/2022 - 31/02/2022",
                                "total": 240000,
                                "totalText": "240,000đ",
                                "billNumber": "SG823759DN288",
                                "type": "RECEIPT",
                                "receiptType": -1,
                                "allowDelete"   : true,
                                "allowUpdated"  : false,
                                "checkedGroup": false,
                                "evcCode": "",
                                "evcTitle": "Thanh toán điểm FGold",
                                "evcAmount": 0,
                                "evcAmountText": "0đ",
                                "evcType": "hidden"
                            ]as [String : Any]
                        
                    ] as [String : Any],
                    [
                        "contractTypeName": "Trả hộ",
                        "title": "Nguyễn Tấn Dũng - DNP119832",
                        "contractNo": "SGH124941",
                        "iconUrl": "",
                        "listBill": [
                            
                            "titleBill": "Hoá đơn T5/2023",
                            "contentBill": "Khoản thu từ 01/07/2022 - 31/02/2022",
                            "total": 240000,
                            "totalText": "240,000đ",
                            "billNumber": "SG823759DN288",
                            "type": "BILLING",
                            "receiptType": -1,
                            "allowDelete"   : true,
                            "allowUpdated"  : false,
                            "checkedGroup": false,
                            "evcCode": "",
                            "evcTitle": "Thanh toán điểm FGold",
                            "evcAmount": 0,
                            "evcAmountText": "0đ",
                            "evcType": "select"
                        ]as [String : Any]
                    ]
                ],
                "screenType": "detail",
                "activityFlow" : " one_contract",
                "contents": [
                    "textNoBill": "Không có hóa đơn!"
                ]
            ] as [String : Any]
        ]as [String : Any]
    )
    let billCategoryRawJson: JSON = JSON (
        [
            "statusCode": 0,
            "message": "Thành công",
            "data": [
                "total": 5,
                "iconsPerRow": 5,
                "items": [
                    [
                        "title": "Điện",
                        "actionType": "go_to_screen",
                        "dataAction": "FOXPAY_ELECTRICITY_BILL",
                        "iconUrl": "https://hi-static.fpt.vn/sys/hifpt/icons/hi-customer/6_2/Hoa_don_tien_dien.png",
                        "data": [
                            "id": 5,
                            "name": "Điện"
                        ] as [String : Any]
                    ],
                    [
                        "title": "Nước",
                        "actionType": "go_to_screen",
                        "dataAction": "FOXPAY_WATER_BILL",
                        "iconUrl": "https://hi-static.fpt.vn/sys/hifpt/icons/hi-customer/6_2/Hoa_don_tien_nuoc.png",
                        "data": [
                            "id": 8,
                            "name": "Nước"
                        ] as [String : Any]
                    ],
                    [
                        "title": "Điện thoại\ncố định",
                        "actionType": "go_to_screen",
                        "dataAction": "FOXPAY_LANDLINE",
                        "iconUrl": "https://hi-static.fpt.vn/sys/hifpt/icons/hi-customer/6_2/Dien_thoai_co_dinh.png",
                        "data": [
                            "id": 14,
                            "name": "Điện thoại cố định"
                        ] as [String : Any]
                    ],
                    [
                        "title": "Di động\ntrả sau",
                        "actionType": "go_to_screen",
                        "dataAction": "FOXPAY_POSTPAID_MOBILE",
                        "iconUrl": "https://hi-static.fpt.vn/sys/hifpt/icons/hi-customer/6_2/Di_dong_tra_sau.png",
                        "data": [
                            "id": 13,
                            "name": "Di động trả sau"
                        ] as [String : Any]
                    ] as [String : Any?],
                    [
                        "title": "Nạp tiền\nđiện thoại",
                        "actionType": "go_to_screen",
                        "dataAction": "FOXPAY_PHONE_RECHARGE",
                        "iconUrl": "https://hi-static.fpt.vn/sys/hifpt/icons/hi-customer/6_2/Nap_tien_dien_thoai.png",
                        "data": nil
                    ]
                ]
            ] as [String : Any]
        ] as [String : Any]
        
    )
    
    func callBannerAPI(completion: @escaping ([BannerDataModel]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            
            
            completion(BannerModel(json: self.bannerRawJson).data)
            
            
        }
    }
    
    func callTransactionAPI(completion: @escaping (TransactionDataModel) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            completion(TransactionDataModel(json: self.transactionRawJson["data"]))
        }
    }
    
    func callBillCategoryAPI(completion: @escaping (BillCategoryDataModel) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            completion( BillCategoryDataModel(json: self.billCategoryRawJson["data"]) )
            
        }
    }
    func calllistbillAPI(completion: @escaping (ContractBillModel) -> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            completion(ContractBillModel(json: self.listbill["data"]))
        }
    }
}
