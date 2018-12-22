//
//  UITableViewExtension.swift
//  CineDB
//
//  Created by Baran Karaoğuz on 9.09.2018.
//  Copyright © 2018 CodingMind. All rights reserved.
//

import UIKit


extension UITableView {
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "Quicksand", size: 15)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel;
    }
    
    func restore() {
        self.backgroundView = nil
    }
    
    func registerNib<T>(witClassAndIdentifier:T.Type) {
        
        self.register(UINib.init(nibName: String(describing: T.self), bundle: nil), forCellReuseIdentifier: String(describing: T.self))
    }
    
    func dequeueCell<T>(withClassAndIdentifier classAndIdentifier: T.Type, for indexPath: IndexPath) -> T {
        
        return self.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
    }
    
    
}
