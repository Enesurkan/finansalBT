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
    var tooPatient : CGFloat! = 75
    var patient : CGFloat! = 50
    var lowPatient : CGFloat! = 25
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
        self.backButton.backgroundColor = UIColor.kshadowBlack
        self.backButton.backgroundColor = UIColor.kturkuaz
        self.backButton.layer.addRadius(radius: 20)
        self.backButton.layer.addShadow(color: UIColor.kturkuaz, shadowRadius: 4)
        
//        let x = CGFloat(string: (self.testResponseModel.testValue ?? nil) ?? "")
//        self.cirleViewValue = x
        if(cirleViewValue > tooPatient){
            self.textView.text = "1. derece hastalık belirtisi"
        }else if((cirleViewValue < tooPatient) && (patient < cirleViewValue)){
            self.textView.text = "2. derece hastalık belirtisi"
        }else if((cirleViewValue < patient) && (cirleViewValue > lowPatient)){
            self.textView.text = "3. derece hastalık belirtisi"
        }else{
            self.textView.text = "Hastalık belirtisine rastlanmamıştır."
        }
        
        
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
