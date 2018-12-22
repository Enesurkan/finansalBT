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
        
        if(indexPath.row == TestTextFieldType.TestTextFieldTypeWBC.rawValue){
            textField.placeholder = "WBC Değerini Giriniz(Örn: 12.5)"
        } else if(indexPath.row == TestTextFieldType.TestTextFieldTypeNE.rawValue){
            textField.placeholder = "NE Değerini Giriniz(Örn: 12.5)"
        } else if(indexPath.row == TestTextFieldType.TestTextFieldTypeRBC.rawValue){
            textField.placeholder = "RBC Değerini Giriniz(Örn: 12.5)"
        } else if(indexPath.row == TestTextFieldType.TestTextFieldTypeHGB.rawValue){
            textField.placeholder = "HGB Değerini Giriniz(Örn: 12.5)"
        } else if(indexPath.row == TestTextFieldType.TestTextFieldTypeHCT.rawValue){
            textField.placeholder = "HCT Değerini Giriniz(Örn: 12.5)"
        } else if(indexPath.row == TestTextFieldType.TestTextFieldTypeMCHC.rawValue){
            textField.placeholder = "MCHC Değerini Giriniz(Örn: 12.5)"
        } else if(indexPath.row == TestTextFieldType.TestTextFieldTypeMCH.rawValue){
            textField.placeholder = "MCH Değerini Giriniz(Örn: 12.5)"
        } else if(indexPath.row == TestTextFieldType.TestTextFieldTypeMCV.rawValue){
            textField.placeholder = "MCV Değerini Giriniz(Örn: 12.5)"
        } else if(indexPath.row == TestTextFieldType.TestTextFieldTypeLYM.rawValue){
            textField.placeholder = "LYM Değerini Giriniz(Örn: 12.5)"
        } else if(indexPath.row == TestTextFieldType.TestTextFieldTypeRDW.rawValue){
            textField.placeholder = "RDW Değerini Giriniz(Örn: 12.5)"
        } else if(indexPath.row == TestTextFieldType.TestTextFieldTypePLT.rawValue){
            textField.placeholder = "PLT Değerini Giriniz(Örn: 12.5)"
        } else if(indexPath.row == TestTextFieldType.TestTextFieldTypeMPV.rawValue){
            textField.placeholder = "MPV Değerini Giriniz(Örn: 12.5)"
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
    
    case TestTextFieldTypeWBC = 0, TestTextFieldTypeNE, TestTextFieldTypeRBC, TestTextFieldTypeHGB,TestTextFieldTypeHCT, TestTextFieldTypeMCHC, TestTextFieldTypeMCH,TestTextFieldTypeMCV, TestTextFieldTypeLYM, TestTextFieldTypeRDW,TestTextFieldTypePLT, TestTextFieldTypeMPV
}
