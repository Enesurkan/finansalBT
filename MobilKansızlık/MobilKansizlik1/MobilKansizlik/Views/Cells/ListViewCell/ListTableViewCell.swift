//
//  ListTableViewCell.swift
//  MobilKansizlik
//
//  Created by Enes urkan on 19.11.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import UIKit

class ListTableViewCell: BaseTableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureIU()
    }
    
}

extension ListTableViewCell{
    internal func configureIU () {
        
        cellView.layer.addRadius(radius: 10.0)
        cellView.layer.addShadow(color: .black, shadowRadius: 2.0)
        
        cellImageView.layer.borderWidth = 2
        cellImageView.layer.borderColor = UIColor.black.cgColor
        
        self.cellLabel.text = ""
        
    }
    
    func fillData(_ data : NewsModel){
        self.cellLabel.text = data.newsTitle
        self.cellImageView.downloaded(from: data.newsImage!)
    }
}





