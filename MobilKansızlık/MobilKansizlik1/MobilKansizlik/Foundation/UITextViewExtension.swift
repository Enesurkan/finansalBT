//
//  UITextViewExtension.swift
//  CineDB
//
//  Created by Baran on 9.08.2018.
//  Copyright © 2018 CodingMind. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    
    func addPadding(direction: Direction, padding: CGFloat){
        switch direction {
        case .bottom:
            self.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: padding, right: 0)
        case .top:
            self.textContainerInset = UIEdgeInsets(top: padding, left: 0, bottom: 0, right: 0)
        case .left:
            self.textContainerInset = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: 0)
        case .right:
            self.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: padding)
        }
    }
    
    
}

enum Direction {
    case bottom
    case top
    case left
    case right
}
