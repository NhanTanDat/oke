//
//  PayHomeVC.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 8/21/23.
//

import UIKit

class PayHomeVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var vm: PayHomeVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVM()
        setUI()
        
       
    }
    func setUpVM(){
        vm = PayHomeVM()
        vm?.delegate = self
        vm?.fetchPaymentTblData()
    }
    func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ContractbBillTblCell", bundle: nil), forCellReuseIdentifier: "ContractbBillTblCell")
        tableView.register(UINib(nibName: "TelecomBillTblCell", bundle: nil), forCellReuseIdentifier: "TelecomBillTblCell")
        tableView.register(UINib(nibName: "PayTblCell", bundle: nil), forCellReuseIdentifier: "PayTblCell")
        
        tableView.register(HeaderSectionView.nib(), forHeaderFooterViewReuseIdentifier: HeaderSectionView.identifier)
        tableView.register(BannerCell.nib(), forCellReuseIdentifier: BannerCell.identifier)
        tableView.register(BillCategoryCell.nib(), forCellReuseIdentifier: BillCategoryCell.identifier)
        tableView.register(RecentTransactionCell.nib(), forCellReuseIdentifier: RecentTransactionCell.identifier)
        tableView.register(EmptyTextPlaceHolderCell.self, forCellReuseIdentifier: EmptyTextPlaceHolderCell.identifier)
        tableView.separatorStyle = .none
        
        vm?.baseCallback = {
            self.tableView.reloadData()
        }
    }
}
extension PayHomeVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return vm?.paymentTbvData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vm = self.vm else{
            print("VM is nil")
            return 0
        }
        switch vm.paymentTbvData[section] {
        case .banner:
            return 1
        case .BillList(_):
            return 1
            
        case.billCategories:
            return 1
        case .recentTransactions:
            return 1
            
        }
    }
    
    //MARK: - Header section
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let vm = self.vm else{
            print("VM is nil")
            return UIView()
        }
        
        switch vm.paymentTbvData[section] {
        case .banner:
            return nil
        default:
            break
            
        }
       
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderSectionView.identifier) as? HeaderSectionView
        
        guard let headerView = headerView else {
            print("Header View is nil")
            return nil
        }
        
        switch vm.paymentTbvData[section] {
        case .banner:
            return nil
        case .billCategories:
            headerView.configure(leadingLabel: "Hoá đơn khác")
        case .recentTransactions:
            headerView.configure(leadingLabel: "Giao dịch gần đây")
        case .BillList(_):
            headerView.configure(leadingLabel: "Giao dịch gần đây")
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let vm = self.vm else{
            print("VM is nil")
            return 0
        }
        
        
        switch vm.paymentTbvData[section] {
        case .banner:
            return 0
        default:
            return 32.0 + 16.0
        }
  
    }
    //MARK: - Cell for rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let vm = self.vm else{
            print("VM is nil")
            return UITableViewCell()
        }
        
        switch (vm.paymentTbvData[indexPath.section]){
        case .banner(let bannerModels):
            let cell = tableView.dequeueReusableCell(withIdentifier: BannerCell.identifier, for: indexPath) as? BannerCell
            
            guard let cell = cell else {
                print("Cell is nil")
                return UITableViewCell()
            }
            
            cell.bannerData = bannerModels
            
            return cell
        case .BillList(_):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContractbBillTblCell", for: indexPath) as? ContractbBillTblCell
            guard let cell = cell else {
                print("Cell is nil")
                return UITableViewCell()
                
            }
            return cell
            
        case .billCategories(let billcategoriesDataModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: BillCategoryCell.identifier, for: indexPath) as? BillCategoryCell
            
            guard let cell = cell else {
                print("Cell is nil")
                return UITableViewCell()
            }
            
            cell.billCategoriesData = billcategoriesDataModel
            
            return cell
            
        case .recentTransactions(let transactionsDataModel):
            ///Cell for no transactions
            if transactionsDataModel.histories.isEmpty {
                let cell = tableView.dequeueReusableCell(withIdentifier: EmptyTextPlaceHolderCell.identifier) as? EmptyTextPlaceHolderCell
                
                guard let cell = cell else {
                    return UITableViewCell()
                }
                
                cell.configure(placeHolderText: transactionsDataModel.content.textNoBill)
                
                return cell
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: RecentTransactionCell.identifier, for: indexPath) as? RecentTransactionCell
            
            guard let cell = cell else {
                print("Cell is nil")
                return UITableViewCell()
                
            }
            
            cell.transactionHistoryModel = transactionsDataModel.histories[indexPath.row]
            
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let vm = self.vm else{
            print("VM is nil")
            return 0.0
        }
        
        switch vm.paymentTbvData[indexPath.section] {
        case .banner:
            return 80.0
        case .billCategories:
            return 120.0
        default:
            return UITableView.automaticDimension
            
        }
 
    }
}
extension PayHomeVC: PaymentVMDelegate {
    func didGetNewTbvData() {
        tableView.reloadData()
    }
}
