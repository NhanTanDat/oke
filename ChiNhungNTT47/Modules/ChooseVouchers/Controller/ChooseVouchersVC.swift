//
//  ChooseVouchersVC.swift
//  Hi Health
//
//  Created by TaiVC on 8/3/23.
//

import UIKit
import IQKeyboardManagerSwift

class ChooseVouchersVC: UIViewController{
    
    var viewModel: VouchersVM = VouchersVM()
    
    @IBOutlet weak var viewSeach: UIView!
    @IBOutlet weak var textSeach: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewfooter: UIView!
    @IBOutlet weak var TotalOffer: UILabel!
    @IBOutlet weak var btnApplyVouchers: UIButton!
    @IBOutlet weak var ViewContenSeach: UIView!
    @IBOutlet weak var viewBTN_KT: UIView!
    
    var totalCheckVoucher: Int = 0
    func seeMore(){
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seUpViewModel()
        setUI()
        
    }
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        if(textSeach.text == "" ){
            viewBTN_KT.backgroundColor = hexStringToUIColor(hex: "#C7CBCF")
        }else{
            viewBTN_KT.backgroundColor = hexStringToUIColor(hex: "#3C4D6E")
        }
    }
    
    func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "ChooseOfferTblCell", bundle: nil), forCellReuseIdentifier: "ChooseOfferTblCell")
        tableView.register(UINib(nibName: "NameOfferVoucherTblCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "NameOfferVoucherTblCell")
        tableView.register(UINib(nibName: "SeeMoreVoucherTbl", bundle: nil), forHeaderFooterViewReuseIdentifier: "SeeMoreVoucherTbl")
        
        ViewContenSeach.layer.cornerRadius = 16
        ViewContenSeach.layer.borderWidth = 1
        ViewContenSeach.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        
        viewBTN_KT.layer.cornerRadius = viewBTN_KT.frame.height/2
        
        btnApplyVouchers.layer.cornerRadius = 8
        
        textSeach.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
    func reloadBTNApplyVouchers(){
        self.totalCheckVoucher = viewModel.gettoTalVoucherCheck()
        
        if totalCheckVoucher > 0{
            btnApplyVouchers.backgroundColor = hexStringToUIColor(hex: "#3C4E6D")
        }else{
            btnApplyVouchers.backgroundColor = hexStringToUIColor(hex: "#C7CBCF")
        }
        TotalOffer.text = "\(totalCheckVoucher) ưu đãi đã chọn"
    }
    func seUpViewModel(){
        viewModel.baseCallbackReloadData = { [weak self] in
            self?.tableView.reloadData()
        }
        if viewModel.getTotalServiceVouchers() < 1{
            viewModel.fetchData(vc: self)
        }
        reloadBTNApplyVouchers()
    }
}
extension ChooseVouchersVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfItem()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = viewModel.itemAt(index: section)
        if(data?.isExpanded == false){
            return 3
        }else{
            return viewModel.getTotalItemVoucher(item: section)
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if viewModel.itemAt(index: section)?.titleService == "" {
            return nil
        }else{
            let data = viewModel.itemAt(index: section)
            let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "NameOfferVoucherTblCell") as! NameOfferVoucherTblCell
            cell.setUpui(title: data!.titleService, descriptionV: data!.descriptionService)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if viewModel.itemAt(index: section)?.titleService == "" {
            return nil
        }else{
            let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SeeMoreVoucherTbl") as! SeeMoreVoucherTbl
            if self.viewModel.itemAt(index: section)?.isExpanded == false {
                cell.setUpUi(text: "Xem thêm", image: UIImage(named: "Frame 958475960")!)
            } else{
                cell.setUpUi(text: "Thu gọn", image: UIImage(named: "Frame 958475960")!)
            }
            cell.callbackSeeMore = {
                if self.viewModel.itemAt(index: section)?.isExpanded == false {
                    self.viewModel.setExPanded(index: section, isEx: true)
                    cell.setUpUi(text: "Thu gọn", image: UIImage(named: "Frame 958475960")!)
                } else{
                    self.viewModel.setExPanded(index: section, isEx: false)
                    cell.setUpUi(text: "Xem thêm", image: UIImage(named: "Frame 958475960")!)
                }
                tableView.reloadSections(IndexSet.init(integer: section), with: .none)
            }
            return cell
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataListVoucher = viewModel.items
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseOfferTblCell") as! ChooseOfferTblCell
        cell.setUpUI(title: dataListVoucher[indexPath.section].listVouchers[indexPath.row].titleVoucher, descriptions: dataListVoucher[indexPath.section].listVouchers[indexPath.row].descriptionVouchers, expiration_Date: dataListVoucher[indexPath.section].listVouchers[indexPath.row].expires, isSelected: dataListVoucher[indexPath.section].listVouchers[indexPath.row].isCheck)
        cell .selectionStyle = .none
        cell.callbackCheckVoucher = { [weak self] in
            guard let self = self else { return }
            if self.viewModel.itemAt(index: indexPath.section)?.multiSelexted == false {
                self.viewModel.setlistCheckVoucher(indexSection: indexPath.section, indexRow: indexPath.row)
                tableView.reloadSections(IndexSet.init(integer: indexPath.section), with: .none)
            }else {
                if self.viewModel.getCheckVoucher(indexSection: indexPath.section, indexRow: indexPath.row) == false {
                    self.viewModel.setCheckVoucher(indexSection: indexPath.section, indexRow: indexPath.row, isCheck: true)
                }else{
                    self.viewModel.setCheckVoucher(indexSection: indexPath.section, indexRow: indexPath.row, isCheck: false)
                }
                tableView.reloadRows(at: [indexPath], with: .none)
            }
            
            self.reloadBTNApplyVouchers()
        }
        cell.callbackTapOfferDetail = { [weak self] in
            guard let self = self else { return }
            ChooseOfferManager.shared.pushToOfferDetailsVC(vc: self)
        }
        return cell
    }
}
