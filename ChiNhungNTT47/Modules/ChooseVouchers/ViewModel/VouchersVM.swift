//
//  VouchersVM.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 8/4/23.
//

import Foundation

class VouchersVM: BaseViewModel<ServiceVoucher>{
    var model: ChooseVoucherModel?
    
    var indexSelectedVoucher: [Int:Int] = [:]
    
    var seachVouchers: ServiceVoucher?

    func setData(){
        var voucherList: [ServiceVoucher] = []
        if let seachVouchers = self.seachVouchers {
            voucherList.append(seachVouchers)
        }
        voucherList.append(contentsOf: (model?.serviceList ?? []))
        
        self.setDataItems(data: voucherList)
    }
    func setExPanded(index: Int, isEx: Bool){
        self.items[index].isExpanded = isEx
    }
    func setCheckVoucher(indexSection: Int ,indexRow: Int , isCheck: Bool){
        self.items[indexSection].listVouchers[indexRow].isCheck = isCheck
    }
    func getCheckVoucher(indexSection: Int ,indexRow: Int ) -> Bool{
        return self.items[indexSection].listVouchers[indexRow].isCheck
    }
    func setlistCheckVoucher(indexSection: Int ,indexRow: Int) {
        if self.items[indexSection].listVouchers[indexRow].isCheck == false{
            self.setCheckVoucher(indexSection: indexSection, indexRow: indexSelectedVoucher[indexSection] ?? 0, isCheck: false)
            self.indexSelectedVoucher[indexSection] = indexRow
            self.setCheckVoucher(indexSection: indexSection, indexRow: indexRow, isCheck: true)
        }else{
            self.setCheckVoucher(indexSection: indexSection, indexRow: indexRow, isCheck: false)
        }
    }
    func gettoTalVoucherCheck() -> Int{
        var total: Int = 0
        // ??????? filter for this case
        self.items.forEach({ ServiceVoucher in
            ServiceVoucher.listVouchers.forEach { VoucherItem in
                if VoucherItem.isCheck == true {
                    total += 1
                }
            }
        })
        return total
    }

    func checkVoucher(){
        self.seachVouchers = ServiceVoucher(titleService: "", descriptionService: "", multiSelexted: true, listVouchers: [ VoucherItem(idVoucher: "1234", type_voucher: "", titleVoucher: "Chị nhung", descriptionVouchers: "ap dụng cho chị nhung 20k ", expires: "", obligatory: true, activated: true)])
    }
    func getListVoucher() -> [ServiceVoucher]{
        return self.items
    }
    func getIteamVoucher(index: Int) -> [VoucherItem]{
        return self.itemAt(index: index)!.listVouchers
    }
    var actionBindingData: (() -> Void)?
    
    func getTotalServiceVouchers() -> Int{
        return self.items.count
    }
    func getTotalItemVoucher(item: Int) -> Int{
        return self.itemAt(index: item)!.listVouchers.count
    }
    func fetchData(vc: ChooseVouchersVC){
        self.model = ChooseVoucherModel(serviceList: [
            ServiceVoucher(titleService: "Ưu đãi dịch vụ", descriptionService: "Có thể chọn 1 hoặc nhiều ưu đãi", multiSelexted: true, listVouchers: [ VoucherItem(idVoucher: "4", type_voucher: "", titleVoucher: "Chị nhung", descriptionVouchers: "ap dụng cho chị nhung 20k ", expires: "", obligatory: true, activated: true),VoucherItem(idVoucher: "1", type_voucher: "", titleVoucher: "Chị ngọc", descriptionVouchers: "ap dụng cho chị ngọc 40k", expires: "", obligatory: true, activated: true),VoucherItem(idVoucher: "3", type_voucher: "", titleVoucher: "Chị ngọc", descriptionVouchers: "ap dụng cho chị ngọc 40k", expires: "", obligatory: true, activated: true),VoucherItem(idVoucher: "5", type_voucher: "", titleVoucher: "Chị ngọc", descriptionVouchers: "ap dụng cho chị ngọc 40k", expires: "", obligatory: true, activated: true),VoucherItem(idVoucher: "2", type_voucher: "", titleVoucher: "Chị ngọc", descriptionVouchers: "ap dụng cho chị ngọc 40k", expires: "", obligatory: true, activated: true),VoucherItem(idVoucher: "6", type_voucher: "", titleVoucher: "Chị ngọc", descriptionVouchers: "ap dụng cho chị ngọc 40k", expires: "", obligatory: true, activated: true)]),
            ServiceVoucher(titleService: "Ưu đãi thanh toán", descriptionService: "Có thể chọn 1 hoặc nhiều ưu đãi", multiSelexted: false, listVouchers: [ VoucherItem(idVoucher: "12", type_voucher: "", titleVoucher: "Anh nghĩa", descriptionVouchers: "ap dụng cho anh nghĩa 40k", expires: "", obligatory: true, activated: true),VoucherItem(idVoucher: "8", type_voucher: "", titleVoucher: "Chị ngọc", descriptionVouchers: "ap dụng cho chị ngọc 40k", expires: "", obligatory: true, activated: true),VoucherItem(idVoucher: "10", type_voucher: "", titleVoucher: "Chị ngọc", descriptionVouchers: "ap dụng cho chị ngọc 40k", expires: "", obligatory: true, activated: true),VoucherItem(idVoucher: "9", type_voucher: "", titleVoucher: "Chị ngọc", descriptionVouchers: "ap dụng cho chị ngọc 40k", expires: "", obligatory: true, activated: true),VoucherItem(idVoucher: "7", type_voucher: "", titleVoucher: "Chị ngọc", descriptionVouchers: "ap dụng cho chị ngọc 40k", expires: "", obligatory: true, activated: true),VoucherItem(idVoucher: "15", type_voucher: "", titleVoucher: "Chị ngọc", descriptionVouchers: "ap dụng cho chị ngọc 40k", expires: "", obligatory: true, activated: true),VoucherItem(idVoucher: "17", type_voucher: "", titleVoucher: "Anh nghĩa", descriptionVouchers: "ap dụng cho anh nghĩa 40k", expires: "", obligatory: true, activated: true),VoucherItem(idVoucher: "18", type_voucher: "", titleVoucher: "Chị ngọc", descriptionVouchers: "ap dụng cho chị ngọc 40k", expires: "", obligatory: true, activated: true),VoucherItem(idVoucher: "13", type_voucher: "", titleVoucher: "Chị ngọc", descriptionVouchers: "ap dụng cho chị ngọc 40k", expires: "", obligatory: true, activated: true),VoucherItem(idVoucher: "16", type_voucher: "", titleVoucher: "Chị ngọc", descriptionVouchers: "ap dụng cho chị ngọc 40k", expires: "", obligatory: true, activated: true),VoucherItem(idVoucher: "14", type_voucher: "", titleVoucher: "Chị ngọc", descriptionVouchers: "ap dụng cho chị ngọc 40k", expires: "", obligatory: true, activated: true),VoucherItem(idVoucher: "11", type_voucher: "", titleVoucher: "Anh khang", descriptionVouchers: "ap dụng cho thang khang 4k", expires: "", obligatory: true, activated: true)])
        ])
        self.setData()
    }
}

