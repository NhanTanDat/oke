//
//  StatusCode.swift
//  Hi Health
//
//  Created by TaiVC on 7/25/23.
//

import Foundation

enum StatusCode: Int {
    init(_ type: Int) {
        if let type = StatusCode(rawValue: type) {
            self = type
        } else {
            self = .UNDEFINED
        }
    }
    
    case UNDEFINED = -9999
    case SUCCESS = 0
    case DATA_NULL = 6
    case CLIENT_ERROR = -1
    case ERROR_SESSION = 3
    case EXPIRED_SESSION = 10
    case EXECUTING_GIFT = 16
    case OUT_STOCK_GIFT = 18
    case OUT_OF_POINT = 19
    //case EXPIRED_DATE_GIFT = 20 - LOYALTY DELETE
    case PAID_BILL = 31 //Anh Trí confirm hk đổi nữa.
    case PAY_SEARCH_LOCK = 15
    // Do Status code 20, 21 các anh API không nhớ nó là gì;
    // trong code đang xử lý giống trường hợp văng về login
    // Nên sẽ xử lý tương tự trên Hi-Authen
    case ACCESSTOKEN_EXPIRE = 20 //Renew accessToken With Token Biometric - expire
    case ACCESSTOKEN_DELETE = 21 //Renew accessToken With Token Biometric - delete
    case FOXY_FPT_TV_OWNER = 17 //5.4 Foxy
    case CAMERA_DATA_NULL = 686
    case FSECURE_TOAST_SUCCESS = 11000
    case FSECURE_TOAST_FAILED = 11001
    case FSECURE_PROFILE_TXTFIELD_WRONG = 11002
    case FSECURE_REPLACE_POPUP = 11003
    case LC_SHOW_MESSAGE_LABEL = 12005
    //AUTHEN V5.11
    case AUTHEN_EXPIRE_TOKEN = 10403
    case AUTHEN_WRONG_SIGNATURE = 10404
    case AUTHEN_ACTIVE_PHONE = 10001
    case AUTHEN_EXPIRE_REFRESH_TOKEN = 38015
    
    //V5.13.1
    case SURVER_SAVE_NOT_SUCCESS = 1
    
    //V6.1.1
    case HDI_WARNING = 98011
    case VOUCHER_WRONG_PARAMS = 400 // Sai thông tin đầu vào, vui lòng kiểm tra lại thông tin
    case VOUCHER_EMPTY_OR_INVALID = 707 // Mã voucher rỗng hoặc không hợp lệ
    case VOUCHER_IS_USED = 708 // Mã voucher đã được sử dụng trước đó
    case VOUCHER_IS_INVALID = 709 //Mã voucher không thuộc chương trình khuyến mãi này
    case VOUCHER_WRONG_DATE = 710 // Mã voucher chưa có hiệu lực sử dụng
    case VOUCHER_EXPIRED = 711 // Mã voucher đã hết hạn
    case VOUCHER_NOT_UPDATE = 712 // Mã voucher đã được sử dụng không thể cập nhật
    case VOUCHER_END_PROMOTION = 713 // Chương trình đã kết thúc
    case VOUCHER_NOT_REACH_LIMIT = 714 // Tổng tiền không đủ áp dụng mã voucher
    //6.3.2
    case FORCE_UPDATE = 50000
    //6.6
    case VOUCHER_INVALID = 98013
    
    //7.0
    case INPUT_OTP_OVER_6_TIMES = 38007 // Otp nhập quá 6 lần
    case USER_NAME_DUPLICATED = 92007
    case PC_OTP_VERIFY_REQUEST = 10005
    case INPUT_OTP_LIMITED = 92009
    case SEND_OTP_LIMITED = 92008
    case PC_PROFILE_ALREADY_DELETED = 92010
    case PC_PROFILE_NOT_EXIST = 92011
    case PC_DEVICE_ALREADY_ASSIGNED = 92012
    case PC_USER_ALREADY_DELETED = 92013
    //6.8
    case MISSING_CREDENTIAL = 7
    case TIMEOUT = 13
}
