//
//  TestResponseModel.swift
//  MobilKansizlik
//
//  Created by Enes Urkan on 13.12.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import Foundation
import ObjectMapper

class TestResponseModel: NSObject, Mappable {
    
    var testValue : String?
    var testValueDesc : String?
    
    override init() {
        super .init()
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        testValue <- map["DiseaseValue"]
        testValueDesc <- map["TestDesc"]
    }
}
