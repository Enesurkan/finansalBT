//
//  UITextFieldExtension.swift
//  CineDB
//
//  Created by Baran on 9.08.2018.
//  Copyright © 2018 CodingMind. All rights reserved.
//

import Foundation
import UIKit

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}


extension UITextField{
    func validTest (_ textField: UITextField, type: TextFieldType){
        var newLength : Int
        textField.delegate = self as? UITextFieldDelegate
        if type.rawValue == TextFieldType.testValue.rawValue {
            newLength = textField.text!.count
            if newLength == 0 {
                textField.layer.borderWidth = 1
                textField.layer.borderColor = UIColor.red.cgColor
            }else{
                let character = textField.text?.last!
                let str = String(character!)
                if(str == "."){
                    textField.layer.borderWidth = 1
                    textField.layer.borderColor = UIColor.red.cgColor
                }else{
                    textField.layer.borderColor = UIColor.lightGray.cgColor
                }
                
            }
        }
    }
    
    func showValid(_ textField : UITextField){
        
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.red.cgColor
            var imageView : UIImageView
            imageView = UIImageView.init(frame: CGRect(x: 0, y: 15, width: 20, height: 20))
            imageView.image = UIImage(named:"InputTextFieldInvalidIcon")
            textField.rightView?.addSubview(imageView)
        
    }
    
    func disableValid(_ textField : UITextField){
        
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.rightView = nil
        
    }
    
    func testFieldKeyboardValide (_ textField : UITextField) -> Bool{
        
        if(textField.text == ""){
            return true
        }
        let character = textField.text?.last!
        let str = String(character!)
        if((str == "0") || (str == "1") || (str == "2") || (str == "3") || (str == "4") || (str == "5") || (str == "6") || (str == "7") || (str == "8") || (str == "9") || (str == ".") || (str == "")){
            return true
        }
        return false
    }
}




  /*      NSUInteger newLength;
        NSInteger relatedSectionTextField = textField.tag;
        [textField setDelegate:self];
        if(relatedSectionTextField == CheckDoneNameFieldCell){
            newLength = [textField.text length] + [string length] - range.length;
            if(newLength == 0){
                textField.layer.borderColor = [UIColor redColor].CGColor;
            }else{
                [self hideInvalid:textField];        }
            return (newLength > 38) ? NO : YES;
        }*/
