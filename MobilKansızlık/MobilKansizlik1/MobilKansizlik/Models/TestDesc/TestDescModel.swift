//
//  TestDescModel.swift
//  MobilKansizlik
//
//  Created by Enes urkan on 15.12.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import Foundation
import ObjectMapper

class TestDescModel : NSObject, Mappable{
    
    var testDescTitle : String?
    var testDescText : String?
    
    override init() {
        super .init()
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        testDescTitle <- map["testDescTitle"]
        testDescText <- map["testDescText"]
    }
}
