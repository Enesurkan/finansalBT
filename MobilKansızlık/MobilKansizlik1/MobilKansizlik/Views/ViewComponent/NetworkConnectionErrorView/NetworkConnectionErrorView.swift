//
//  NetworkConnectionErrorView.swift
//  MobilKansizlik
//
//  Created by EnesUrkan on 19.12.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import UIKit

class NetworkConnectionErrorView: UIView {

    @IBOutlet var errorView: UIView!
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

}

extension NetworkConnectionErrorView{
    
    func configureUI(){
        self.errorView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 90)
    }
    
}
