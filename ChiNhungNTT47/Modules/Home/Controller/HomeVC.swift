//
//  Home.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 8/21/23.
//

import UIKit

class HomeVC: UIViewController{
    @IBOutlet weak var btnPay: UIButton!
    @IBOutlet weak var Voucher: UIButton!
    @IBOutlet weak var testUI: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    @IBAction func pushPay(_ sender: Any) {
        let vc = UIStoryboard.init(name: "PayHomeVC", bundle: Bundle.main).instantiateViewController(withIdentifier: "PayHomeVC") as? PayHomeVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func pushTestUI(_ sender: Any) {
        print("ok")
        let vc = UIStoryboard.init(name: "UITest", bundle: Bundle.main).instantiateViewController(withIdentifier: "UITest") as? UITest
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func pushVoucher(_ sender: Any) {
        let vc = UIStoryboard.init(name: "ChooseVouchersVC", bundle: Bundle.main).instantiateViewController(withIdentifier: "ChooseVouchersVC") as? ChooseVouchersVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func pushPersonalSetting(_ sender: Any) {
        let vc = UIStoryboard.init(name: "PersonalSetting", bundle: Bundle.main).instantiateViewController(withIdentifier: "PersonalSettingVC") as? PersonalSettingVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
