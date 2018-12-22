//
//  Session.swift
//  MobilKansizlik
//
//  Created by Enes Urkan on 13.12.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import UIKit
import AKSideMenu
import Alamofire

class Session: NSObject {
    
    static var sharedInstance = Session()
    static var navigationController = UINavigationController(rootViewController: MainViewController())
    static var leftMenuViewController = LeftMenuViewController()
    static var rightMenuViewController = RightMenuViewController()

    static var sideMenu = AKSideMenu(contentViewController: navigationController, leftMenuViewController: leftMenuViewController, rightMenuViewController: rightMenuViewController)
    static var networkStatus : NetworkReachabilityManager.NetworkReachabilityStatus?
    

    
    func initSession() {
        
    }
    
//    let sideMenuViewController: AKSideMenu = AKSideMenu(contentViewController: navigationController, leftMenuViewController: nil, rightMenuViewController: rightMenuViewController)

}
