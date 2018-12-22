//
//  ReusableTextView.swift
//  dumen
//
//  Created by Enes urkan on 2.12.2018.
//  Copyright © 2018 dumen. All rights reserved.
//

import UIKit

class ReusableTextView: UIView, UITextViewDelegate {

    
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var descTextView: UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let view : UIView = loadNib()
        self.addSubview(view)
        configureUI()
    }

    @IBAction func backBtnAction(_ sender: Any) {
        if let vc = self.parentViewController{
            vc.back(animated: true, isModal: true)
        }
    }
}

extension ReusableTextView{
    
    internal func configureUI(){
        self.separatorView.backgroundColor = UIColor.kSeparator
        self.separatorView.layer.addRadius(radius: 4)
        self.descLabel.textColor = UIColor.kDescLabel
        
    }
    
}


