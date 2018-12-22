//
//  ButtonCell.swift
//  MobilKansizlik
//
//  Created by Enes urkan on 5.12.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import UIKit

class ButtonCell: UITableViewCell {

    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

}

extension ButtonCell{
    
    func configureUI(){
        self.buttonView.backgroundColor = UIColor.kshadowBlack
        self.button.backgroundColor = UIColor.kturkuaz
        self.button.layer.addRadius(radius: 20)
        self.button.layer.addShadow(color: UIColor.kturkuaz, shadowRadius: 4)
        
    }
    
}
