//
//  BaseTableViewCell.swift
//  MobilKansizlik
//
//  Created by Enes urkan on 19.11.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.setup()
    }
    
    func setup() {
        self.selectionStyle = .none
    }
    
    func refreshViews() {
        
    }
}
