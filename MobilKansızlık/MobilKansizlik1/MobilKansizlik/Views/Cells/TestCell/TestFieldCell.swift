//
//  TestFieldCell.swift
//  MobilKansizlik
//
//  Created by Enes urkan on 5.12.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import UIKit

class TestFieldCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var customDescView: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension TestFieldCell {
    
    func updateCell(indexPath : NSIndexPath){
        if(indexPath.row == TestTextFieldType.TestTextFieldTypeHGB.rawValue){
            textField.placeholder = "HGB Değerini Giriniz(Örn: 12.5)"
        } else if(indexPath.row == TestTextFieldType.TestTextFieldTypeHCT.rawValue){
            textField.placeholder = "HCT Değerini Giriniz(Örn: 12.5)"
        } else if(indexPath.row == TestTextFieldType.TestTextFieldTypeMCH.rawValue){
            textField.placeholder = "MCH Değerini Giriniz(Örn: 12.5)"
        } else if(indexPath.row == TestTextFieldType.TestTextFieldTypeMCV.rawValue){
            textField.placeholder = "MCV Değerini Giriniz(Örn: 12.5)"
        } else if(indexPath.row == TestTextFieldType.TestTextFieldTypeRBC.rawValue){
            textField.placeholder = "RBC Değerini Giriniz(Örn: 12.5)"
        }
        textField.tag = indexPath.row
    }
   
    
    func configureUI(){
        self.textField.layer.borderWidth = 1
        self.textField.layer.borderColor = UIColor.lightGray.cgColor
        self.textField.layer.cornerRadius = 10
    }
    
    @objc func showDescView(){
        
    }
    
}


enum TestTextFieldType : Int{
    
    case TestTextFieldTypeHGB = 0, TestTextFieldTypeHCT, TestTextFieldTypeMCH, TestTextFieldTypeMCV,TestTextFieldTypeRBC
}

