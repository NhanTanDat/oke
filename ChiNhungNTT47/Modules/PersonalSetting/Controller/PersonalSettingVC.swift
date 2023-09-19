//
//  PersonalSettingVC.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 9/19/23.
//

import UIKit


class PersonalSettingVC: UIViewController{
    @IBOutlet weak var tbl: UITableView!
    
    
    func setUpTbl(){
        tbl.dataSource = self
        tbl.delegate = self
       
        tbl.separatorStyle = .none
        tbl.register(UINib(nibName: "PrivateAccessTbl", bundle: nil), forCellReuseIdentifier: "PrivateAccessTbl")
        tbl.register(UINib(nibName: "ActionAlertTbl", bundle: nil), forCellReuseIdentifier: "ActionAlertTbl")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTbl()
    }
}
extension PersonalSettingVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PrivateAccessTbl") as? PrivateAccessTbl
            cell?.selectionStyle = .none
            guard let cell = cell else {
                print("Cell is nil")
                return UITableViewCell()
            }
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActionAlertTbl") as? ActionAlertTbl
            cell?.selectionStyle = .none
            guard let cell = cell else {
                print("Cell is nil")
                return UITableViewCell()
            }
            return cell
        }
       
    }
    
    
}
