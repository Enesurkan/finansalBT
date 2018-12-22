//
//  UIViewControllerExtension.swift
//  OgrenOgret
//
//  Created by Baran on 28.02.2018.
//  Copyright © 2018 CodingMind. All rights reserved.
//

import UIKit




//Mark: -Tableview build
extension UIViewController {
    func buildTableView(tableView: UITableView, cellIdentifier: String) {
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func buildHomePageTableView(tableView: UITableView, cellIdentifier: String) {
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    

}


//Mark: -Transition support
private var dataAssocKey = 0

extension UIViewController {
    
    var data:AnyObject? {
        get {
            return objc_getAssociatedObject(self, &dataAssocKey) as AnyObject?
        }
        set {
            objc_setAssociatedObject(self, &dataAssocKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func goto(screenID:String) {
        goto(screenID: screenID, animated: true, data: nil, isModal: false, isBottomBarHidden: false)
    }
    
    func goto(screenID:String, animated:Bool) {
        goto(screenID: screenID, animated: animated, data: nil, isModal: false, isBottomBarHidden: false)
    }
    
    func goto(screenID:String, data:AnyObject!) {
        goto(screenID: screenID, animated: true, data: data, isModal: false, isBottomBarHidden: false)
    }
    
    func goto(screenID:String, animated:Bool, data:AnyObject!) {
        goto(screenID: screenID, animated: animated, data: data, isModal: false, isBottomBarHidden: false)
    }
    
    func goto(screenID:String, animated:Bool, data:AnyObject!, isModal:Bool, isBottomBarHidden: Bool) {
        let vc:UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: screenID))!
        if (data != nil) {
            vc.data = data
        }
        if isModal == true {
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: animated, completion:nil)
            
        }
        else {
            self.navigationItem.backBarButtonItem =
                UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            self.navigationController?.interactivePopGestureRecognizer?.delegate = nil;
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
            self.navigationController?.pushViewController(vc, animated: animated)
            self.navigationController?.setNavigationBarHidden(false, animated: false) // Navigation Barı Saklar.
        }
    }
    
    func goto(screenID:String, animated:Bool, data:AnyObject!, isModal:Bool, isNavigation:Bool, showNavBar:Bool, isBottomBarHidden: Bool) {
        let vc:UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: screenID))!
        if (data != nil) {
            vc.data = data
        }
        if isModal == true {
            if isNavigation {
                let navVC:UINavigationController! = UINavigationController(rootViewController: vc)
                navVC.isNavigationBarHidden = !showNavBar
                self.present(navVC, animated: animated, completion:nil)
            }
            else {
                vc.modalPresentationStyle = .overCurrentContext
                self.present(vc, animated: animated, completion:nil)
            }
            
            
        }
        else {
            self.navigationItem.backBarButtonItem =
                UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            self.navigationController?.interactivePopGestureRecognizer?.delegate = nil;
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
            if isBottomBarHidden {
                vc.hidesBottomBarWhenPushed = true
            }
            self.navigationController?.pushViewController(vc, animated: animated)
        }
    }
    
    func goto(screenID:String, storyboardName:String, animated:Bool, data:AnyObject!, isModal:Bool, isNavigation:Bool, showNavBar:Bool) {
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc:UIViewController = (storyboard.instantiateViewController(withIdentifier: screenID))
        if (data != nil) {
            vc.data = data
        }
        if isModal == true {
            if isNavigation {
                let navVC:UINavigationController! = UINavigationController(rootViewController: vc)
                navVC.isNavigationBarHidden = !showNavBar
                self.present(navVC, animated: animated, completion:nil)
            }
            else {
                DispatchQueue.main.async {
                    vc.modalPresentationStyle = .overCurrentContext
                    self.present(vc, animated: animated, completion:nil)
                }
            }
            
            
        }
        else {
            if self.navigationController != nil {
                self.navigationItem.backBarButtonItem =
                    UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
                self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
                self.navigationController?.pushViewController(vc, animated: animated)
            } else {
                 let obj : UINavigationController = self.sideMenuViewController?.contentViewController as! UINavigationController
                obj.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                obj.interactivePopGestureRecognizer?.delegate = nil
                obj.interactivePopGestureRecognizer?.isEnabled = false
                obj.pushViewController(vc, animated: animated)
                self.sideMenuViewController!.hideMenuViewController()
            }
            
        }
        
    }
    
    func back() {
        back(animated: true,isModal: false)
    }
    
    func back(animated:Bool) {
        back(animated: animated, isModal: false)
    }
    
    func back(animated:Bool, isModal:Bool) {
        if isModal == true {
            self.dismiss(animated: animated, completion: nil)
        }
        else {
            self.navigationController?.popViewController(animated: animated)
        }
    }
    
    func back(animated:Bool, screenID:String) {
        var index:NSInteger = -1
        let vcs:NSArray = NSArray(array: (self.navigationController?.viewControllers)!)
        for i in 0...vcs.count {
            
            if (vcs[i] as AnyObject).isKind(of: NSClassFromString("Main.\(screenID)")!) {
                index = i
                break
            }
        }
        if index >= 0 {
            self.navigationController?.popToViewController(vcs[index] as! UIViewController, animated: true)
        }
    }
    
    
    
}
//Mark: -nibname
extension UIViewController {
    static func initFromNib() -> Self {
        func instanceFromNib<T: UIViewController>() -> T {
            return T(nibName: String(describing: self), bundle: nil)
        }
        return instanceFromNib()
    }
}

//Mark: -Return Device Height and Width
extension UIViewController {
    static var deviceWidth : CGFloat {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return screenWidth
    }
    
    static var deviceHeight : CGFloat {
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        return screenHeight
    }
}

//Mark :-Addsubview transition animate
extension UIViewController {
    func opemAnimateView(_ view: UIView) {
        view.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        view.alpha = 0.0;
        UIView.animate(withDuration: 0.35, animations: {
            view.alpha = 1.0
            view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
}

//Mark :- Regex
extension UIViewController {
    // Regex And pattern
    func validateEmail(value: String) -> Bool {
        let EMAIL_REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", EMAIL_REGEX)
        let result =  emailTest.evaluate(with: value)
        return result
    }
    func validatePhone(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{11}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }    
}

//Mark : -Get IP adress
extension UIViewController {
    func getIPAddress() -> String? {
        var address: String?
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next }
                
                let interface = ptr?.pointee
                let addrFamily = interface?.ifa_addr.pointee.sa_family
                if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                    
                    if let name: String = String(cString: ((interface?.ifa_name)!)), name == "en0" {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        getnameinfo(interface?.ifa_addr, socklen_t((interface?.ifa_addr.pointee.sa_len)!), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                        address = String(cString: hostname)
                    }
                }
            }
            freeifaddrs(ifaddr)
        }
        return address
    }
}


