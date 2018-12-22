//
//  AppDelegate.swift
//  MobilKansizlik
//
//  Created by Enes urkan on 17.11.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import AKSideMenu
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate ,AKSideMenuDelegate{
    
    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.apple.com")
    var window: UIWindow?
    var networkError = NetworkConnectionErrorView()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Session.sharedInstance.initSession()
        IQKeyboardManager.sharedManager().enable = true
        isFirstRun()
        listenForReachability()
        return true
    }
    
    func listenForReachability() {
        self.reachabilityManager?.listener = { status in
            Session.networkStatus = status
            print("Network Status Changed: \(status)")
            switch status {
            case .notReachable:

                //animasyon ekle ve tetiklemeyi refresh view metotlarını yap
                self.networkError.tag = 31
                self.window?.addSubview(self.networkError)
                break
            case .reachable(NetworkReachabilityManager.ConnectionType.ethernetOrWiFi):
                if let view = self.window?.viewWithTag(31) as? NetworkConnectionErrorView{
                    view.removeFromSuperview()
                }
                NotificationCenter.default.post(name: Notification.Name("NetworkActive"), object: nil)
                break
                
            case .reachable(NetworkReachabilityManager.ConnectionType.wwan):
                if let view = self.window?.viewWithTag(31) as? NetworkConnectionErrorView{
                    view.removeFromSuperview()
                }
                NotificationCenter.default.post(name: Notification.Name("NetworkActive"), object: nil)
                break
            case .unknown: break
            }
        }
        self.reachabilityManager?.startListening()
    }
    
    func isFirstRun(){
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // Create content and menu controllers
//        let navigationController = UINavigationController(rootViewController: MainViewController())
//        let leftMenuViewController = LeftMenuViewController()
//        let rightMenuViewController = RightMenuViewController()
        
        Session.sideMenu = AKSideMenu(contentViewController: Session.navigationController, leftMenuViewController: nil, rightMenuViewController: Session.rightMenuViewController)
        // Create side menu controller
//        let sideMenuViewController: AKSideMenu = AKSideMenu(contentViewController: navigationController, leftMenuViewController: nil, rightMenuViewController: rightMenuViewController)
        
        Session.sideMenu.backgroundImage = UIImage(named: "Stars")
        Session.sideMenu.menuPreferredStatusBarStyle = .lightContent
        Session.sideMenu.delegate = self
        Session.sideMenu.contentViewShadowColor = .black
        Session.sideMenu.contentViewShadowOffset = CGSize(width: 0, height: 0)
        Session.sideMenu.contentViewShadowOpacity = 0.6
        Session.sideMenu.contentViewShadowRadius = 12
        Session.sideMenu.contentViewShadowEnabled = true
        Session.sideMenu.parallaxEnabled = false
        Session.sideMenu.panGestureRightEnabled = false
        Session.sideMenu.interactivePopGestureRecognizerEnabled = false
        
        self.window?.rootViewController = Session.sideMenu
        
        self.window?.backgroundColor = .white
        self.window?.makeKeyAndVisible()
    }
    
    // MARK: - <AKSideMenuDelegate>
    
    open func sideMenu(_ sideMenu: AKSideMenu, willShowMenuViewController menuViewController: UIViewController) {
        print("willShowMenuViewController")
    }
    
    open func sideMenu(_ sideMenu: AKSideMenu, didShowMenuViewController menuViewController: UIViewController) {
        print("didShowMenuViewController")
    }
    
    open func sideMenu(_ sideMenu: AKSideMenu, willHideMenuViewController menuViewController: UIViewController) {
        print("willHideMenuViewController")
    }
    
    open func sideMenu(_ sideMenu: AKSideMenu, didHideMenuViewController menuViewController: UIViewController) {
        print("didHideMenuViewController")
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

