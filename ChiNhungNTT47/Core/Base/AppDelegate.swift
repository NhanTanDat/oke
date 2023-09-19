//
//  AppDelegate.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 8/4/23.
//

import UIKit


@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

       func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
           
           guard let vc = UIStoryboard.init(name: "HomeVC", bundle: nil).instantiateViewController(identifier: "HomeVC") as? HomeVC else  {
               return false
           }
           
           window = UIWindow(frame: UIScreen.main.bounds)
           let navi = UINavigationController(rootViewController: vc)
           window?.rootViewController = navi
           window?.makeKeyAndVisible()
           
           
           return true
       }
}

