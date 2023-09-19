//
//  UiTest.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 9/15/23.
//

import UIKit


class UITest: UIViewController{
    
    
    @IBOutlet weak var tbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTbl()
    }
    func setUpTbl(){
        tbl.dataSource = self
        tbl.delegate = self
        tbl.separatorStyle = .none
        tbl.register(UINib(nibName: "TestTblCell", bundle: nil), forCellReuseIdentifier: "TestTblCell")
        
    }
}
extension UITest: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestTblCell") as? TestTblCell
        guard let cell = cell else {
            print("Cell is nil")
            return UITableViewCell()
        }
        return cell
    }
    
    
    
}
