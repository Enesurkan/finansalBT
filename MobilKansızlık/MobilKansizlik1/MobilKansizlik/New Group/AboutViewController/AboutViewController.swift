//
//  AboutViewController.swift
//  MobilKansizlik
//
//  Created by Enes urkan on 23.11.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }


}

extension AboutViewController{
    internal func configureUI(){
        
        self.title = "Hakkımızda"
        //NavigationRightButton Create
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(named: "menu"), for: .normal)
        button.addTarget(self, action: #selector(self.presentRightMenuViewController(_:)), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 25).isActive = true
        button.heightAnchor.constraint(equalToConstant: 25).isActive = true
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
        
    }
}
