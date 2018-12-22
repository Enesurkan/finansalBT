//
//  TestModel.swift
//  MobilKansizlik
//
//  Created by Enes urkan on 15.12.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import Foundation
import ObjectMapper

class TestModel : NSObject, Mappable{
    
    var tests : [TestDescModel]?
    
    override init() {
        super .init()
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        tests <- map["Tests"]
    }
    
    
}
