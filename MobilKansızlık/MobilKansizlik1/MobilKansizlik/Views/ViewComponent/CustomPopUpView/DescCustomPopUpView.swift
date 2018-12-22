//
//  DescCustomPopUpView.swift
//  MobilKansizlik
//
//  Created by Enes Urkan on 7.12.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import UIKit

class DescCustomPopUpView: UIView {
    
 
    @IBOutlet weak var descViewHeight: NSLayoutConstraint!
    @IBOutlet weak var descViewWidth: NSLayoutConstraint!
    @IBOutlet weak var testTitle: UILabel!
    @IBOutlet weak var testTextView: UITextView!
    @IBOutlet weak var cancelBtn: UIButton!{
        didSet{
            cancelBtn.addTarget(self, action: #selector(hideView), for: .touchUpInside)
        }
    }
    @IBOutlet weak var containerView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    @IBOutlet weak var backView: UIView!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        let view : UIView = loadNib()
        view.frame = self.bounds
        self.addSubview(view)
        configureUI()
    }
}

extension DescCustomPopUpView{
    
    @objc func hideView(){
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [UIView.AnimationOptions.transitionCurlUp], animations: {
            self.alpha = 0
        }) { (true) in
            self.removeFromSuperview()
            self.alpha = 0      }
    }
    
    internal func configureUI(){
        self.containerView.layer.addRadius(radius: 10)
        self.containerView.layer.borderWidth = 2.0
        self.containerView.layer.borderColor = UIColor.kshadowBlack.cgColor
//        
        if UIDevice.isPhone {
            self.descViewWidth.constant = UIScreen.main.bounds.size.width - 100
            self.descViewHeight.constant = UIScreen.main.bounds.size.height / 2
        }else{
            
            self.descViewWidth.constant = UIScreen.main.bounds.size.width / 2
            self.descViewHeight.constant = UIScreen.main.bounds.size.height / 2
        }
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.backView.addGestureRecognizer(gesture)
    }
    @objc func checkAction(sender : UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [UIView.AnimationOptions.transitionCurlUp], animations: {
            self.alpha = 0
        }) { (true) in
            self.removeFromSuperview()
            self.alpha = 1
            
        }
    }
}


