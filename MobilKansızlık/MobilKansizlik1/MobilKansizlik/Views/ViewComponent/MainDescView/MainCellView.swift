//
//  MainCellView.swift
//  MobilKansizlik
//
//  Created by Enes urkan on 20.11.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import UIKit

class MainCellView: UIView {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cancelBtn: UIButton!{
        didSet{
            cancelBtn.addTarget(self, action: #selector(cancelBtnAction), for: .touchUpInside)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        let view : UIView = loadNib()
        view.frame = self.bounds
        self.addSubview(view)        
    }
    
    @objc func cancelBtnAction() {
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [UIView.AnimationOptions.transitionCurlUp], animations: {
            if let vc = self.parentViewController{
                vc.navigationController?.isNavigationBarHidden = false
            }
            self.alpha = 0
            
        }) { (true) in
            
            self.removeFromSuperview()
            self.alpha = 1
           
        }
    }
    
}


extension MainCellView {
    internal func configureUI(){
        imageView.image = UIImage(named: "")
    }
}
