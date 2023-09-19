//
//  Extension+UIViewController.swift
//  ChiNhungNTT47
//
//  Created by TaiVC on 8/17/23.
//


import UIKit

extension UIPageViewController {
    var isPagingEnabled: Bool {
        get {
            return scrollView?.isScrollEnabled ?? false
        }
        set {
            scrollView?.isScrollEnabled = newValue
        }
    }
    
    var scrollView: UIScrollView? {
        return view.subviews.first(where: { $0 is UIScrollView }) as? UIScrollView
    }
    
}
extension UIViewController {
    func topMostViewController() -> UIViewController {
        var topMostViewController = UIApplication.shared.keyWindow?.rootViewController
        while let presentedViewController = topMostViewController?.presentedViewController {
            topMostViewController = presentedViewController
        }
        return topMostViewController ?? self
    }
    static func view(storyboardName: String, identifier: String) -> UIViewController {
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }

    
    var isModal: Bool {
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController == navigationController
        let presentinIsTabBar = tabBarController?.presentingViewController is UITabBarController
        return presentingIsModal || presentingIsNavigation || presentinIsTabBar
    }
    
    /// push view controller check BaseNavigation
    /// - Parameters:
    ///   - vc: destination
    ///   - animated: is animated or not
    func pushViewControllerHiF(_ vc: UIViewController, animated: Bool) {
       
//        if self.isKind(of: BaseViewController.self) {
//            (vc as? BaseViewController)?.previousScreenId = String(describing: type(of: self))
//        } else if ( self.isKind(of: MyTabbarController.self)) { //HOME
//            (vc as? BaseViewController)?.previousScreenId = String(describing: type(of: self))
//        }

        if self.isKind(of: BaseNavigation.self) {
            if let nav = self as? BaseNavigation {
                nav.pushViewController(vc, animated: animated)
            }
        } else {
            self.navigationController?.pushViewController(vc, animated: animated)
        }
    }
    
    /// pop to root view controller check BaseNavigation
    /// - Parameter animated: is animated or not
    func popToRootViewControllerHiF(animated: Bool) {
        if self.isKind(of: BaseNavigation.self) {
            if let nav = self as? BaseNavigation {
                nav.popToRootViewController(animated: animated)
            }
        } else {
            self.navigationController?.popToRootViewController(animated: animated)
        }
    }

    func showToast(message : String, font: UIFont = UIFont.systemFont(ofSize: 14, weight: .regular)) {
        
        let termView = UIView()
        self.view.addSubview(termView)
        termView.translatesAutoresizingMaskIntoConstraints = false
       // termView.backgroundColor = UIColor(hexString: "#282828").withAlphaComponent(0.75)
        termView.layer.cornerRadius = 10;
        let toastLabel = UILabel()
        toastLabel.backgroundColor = .clear
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = "  " + message + "  "
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0
        
        termView.addSubview(toastLabel)
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toastLabel.leadingAnchor.constraint(equalTo: termView.leadingAnchor, constant : 12),
            toastLabel.centerXAnchor.constraint(equalTo: termView.centerXAnchor),
            toastLabel.topAnchor.constraint(equalTo: termView.topAnchor, constant : 12),
            toastLabel.bottomAnchor.constraint(equalTo: termView.bottomAnchor, constant : -12),
        ])
       
        NSLayoutConstraint.activate([
            termView.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant : 12),
            termView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            termView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant : -110),
        ])
        
        
        UIView.animate(withDuration: 1, delay: 3, options: .curveEaseOut, animations: {
            termView.alpha = 0.0
        }, completion: {(isCompleted) in
            termView.removeFromSuperview()
        })
    }
    
}

extension UIViewController {
    func hifPresentViewController(vc: UIViewController, animated: Bool) {
        // add child vc
        self.addChild(vc)
        self.view.addSubview(vc.view)
        vc.view.transform = .init(translationX: 0, y: vc.view.frame.height)

        if animated {
            UIView.animate(withDuration: 0.4) {
                vc.view.transform = .identity
            } completion: { _ in
                vc.didMove(toParent: self) // active viewdidload
            }
        } else {
            vc.view.transform = .identity
            vc.didMove(toParent: self)
        }
    }
    
    func hifDismissViewController(completion: @escaping (()->Void)) {
        
        willMove(toParent: nil)
        //self.view.layer.add(transition, forKey: nil)
        UIView.animate(withDuration: 0.4) {
            self.view.transform = .init(translationX: 0, y: self.view.frame.height)
        } completion: { _ in
            self.view.removeFromSuperview()
            self.removeFromParent()
            completion()
        }
    }
    
    func addBackground(imageName: String, alpha: CGFloat = 1){
        // Create a UIImageView and set its image to the background image
        let backgroundImage = UIImage(named: imageName)
        let backgroundImageView = UIImageView(image: backgroundImage)
        
        // Set the content mode of the image view to scale aspect fill
        backgroundImageView.contentMode = .scaleAspectFill
        
        // Add the image view to the back of the view controller's view
        view.insertSubview(backgroundImageView, at: 0)
        
        // Set the constraints to fill the entire view
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.alpha = alpha
    }
    
    func isCurrentScreen() -> Bool {
        if self.isViewLoaded && self.view.window != nil {
            // The viewController is currently visible
            return true
        }
        return false
     }
    
}

extension UIViewController {
    
    // MARK: tracking viewDidLoad with swizzle
    
    @objc func trackedViewDidLoad() {
        self.trackedViewDidLoad()
    }
    
    // MARK: tracking viewWillAppear with swizzle
//    @objc func trackedViewWillAppear() {
//        self.trackedViewWillAppear()
//        let loyaltySDK_Controller = self.description
//        print("trackedViewWillAppear === call api tracking \(screenId ?? String(describing: type(of: self)))") // if not set tracking id -> use default
//        self.id = NSUUID().uuidString
//        self.screenId = ControllerClassName(rawValue: "\(String(describing: type(of: self)))")?.getScreenId() ?? ""
//        if self.screenId != "" && !loyaltySDK_Controller.contains("FLoyaltySDK"){
//            let dataTracking = HiScreenTrackingManager.shared.getViewParams(screenId: self.screenId ?? "", previousScreenId: self.previousScreenId ?? "", id: self.id ?? "", externalId: self.externalId ?? "")
//            HiScreenTrackingManager.shared.recordView(screenType: .Start_View, segmentation: dataTracking)
//        }
//        navigationController?.setNavigationBarHidden(true, animated: false)
//
//    }
    
//    // MARK: tracking viewDidDisappear with swizzle
//    @objc func trackedViewDidDisappear() {
//        print("trackedViewDidDisappear === call api tracking \(screenId ?? String(describing: type(of: self)))") // if not set tracking id -> use default
//        self.trackedViewDidDisappear()
//        let screenId = ControllerClassName(rawValue: "\(String(describing: type(of: self)))")?.getScreenId() ?? ""
//        if screenId != "" {
//            let dataTracking = HiScreenTrackingManager.shared.getEndViewParams(screenId: screenId, id: self.id ?? "")
//            HiScreenTrackingManager.shared.recordView(screenType: .End_View, segmentation: dataTracking)
//        }
//    }
    
    static let swizzleViewDidLoad: () = {
        let originSelector = #selector(viewDidLoad)
        let swizzleSelector = #selector(trackedViewDidLoad)
        let originMethod = class_getInstanceMethod(UIViewController.self, originSelector)
        let swizzleMethod = class_getInstanceMethod(UIViewController.self, swizzleSelector)
        method_exchangeImplementations(originMethod!, swizzleMethod!)
    }()
    
//    static let swizzleViewWillAppear: () = {
//        let originSelector = #selector(viewWillAppear)
//        let swizzleSelector = #selector(trackedViewWillAppear)
//        let originMethod = class_getInstanceMethod(UIViewController.self, originSelector)
//        let swizzleMethod = class_getInstanceMethod(UIViewController.self, swizzleSelector)
//        method_exchangeImplementations(originMethod!, swizzleMethod!)
//    }()
//
//    static let swizzleViewDidDisappear: () = {
//        let originSelector = #selector(viewDidDisappear)
//        let swizzleSelector = #selector(trackedViewDidDisappear)
//        let originMethod = class_getInstanceMethod(UIViewController.self, originSelector)
//        let swizzleMethod = class_getInstanceMethod(UIViewController.self, swizzleSelector)
//        method_exchangeImplementations(originMethod!, swizzleMethod!)
//    }()
    
    // MARK: add storable property with AssociatedObject
    private struct AssociatedKeys {
        static var screenId: String = "screenId"
        static var previousScreenId: String = "previousScreenId"
        static var id: String = "id" //UUID
        static var externalId = "externalId"
    }
    
    var screenId: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.screenId) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.screenId, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var previousScreenId: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.previousScreenId) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.previousScreenId, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var id: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.id) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.id, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var externalId: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.externalId) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.externalId, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
