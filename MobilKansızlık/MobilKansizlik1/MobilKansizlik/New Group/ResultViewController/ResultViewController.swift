//
//  ResultViewController.swift
//  MobilKansizlik
//
//  Created by Enes Urkan on 12.12.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import UIKit
import UICircularProgressRing

class ResultViewController: BaseViewController {
    
    var testResponseModel = TestResponseModel()
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var backButton: UIButton!{
        didSet{
            backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        }
    }
    @IBOutlet weak var circleView: UICircularProgressRing!
    var cirleViewValue : CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        circleView.startProgress(to: cirleViewValue, duration: 2.0) {
        }
        
    }
}

extension ResultViewController{
    
    func updateUI(){
        let intValue = Int(cirleViewValue)
        self.backButton.backgroundColor = UIColor.kshadowBlack
        self.backButton.backgroundColor = UIColor.kturkuaz
        self.backButton.layer.addRadius(radius: 20)
        self.backButton.layer.addShadow(color: UIColor.kturkuaz, shadowRadius: 4)
        self.textView.text = "%\(intValue) ihtimal ile hastasınız. Lütfen bir uzman hakime görününüz. İyi günler dileriz."
    }
    
    
    @objc func backButtonAction(){
        DispatchQueue.main.async(execute: {
            Session.sideMenu.setContentViewController(UINavigationController(rootViewController: MainViewController()), animated: true)
            Session.sideMenu.hideMenuViewController()
        })
        
        self.dismiss(animated: true) {
        }
    }
    
}
