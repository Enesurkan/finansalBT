//
//  GeneralResultModel.swift
//  MobilKansizlik
//
//  Created by Enes Urkan on 10.12.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import Foundation
import ObjectMapper

class GeneralResultModel : NSObject, Mappable{
    
    var result : ResultModel?
    
    override init() {
        super .init()
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        result <- map["Result"]
    }
}
