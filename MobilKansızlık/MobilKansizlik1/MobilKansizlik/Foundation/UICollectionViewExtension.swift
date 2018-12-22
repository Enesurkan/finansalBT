//
//  UICollectionViewExtension.swift
//  CineDB
//
//  Created by Baran Karaoğuz on 9.09.2018.
//  Copyright © 2018 CodingMind. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = UIColor.yellow
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "Quicksand", size: 15)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel;
        
    }
    
    func restore() {
        self.backgroundView = nil
        
    }
}
