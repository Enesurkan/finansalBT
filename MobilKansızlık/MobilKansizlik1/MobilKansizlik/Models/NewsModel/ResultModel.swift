//
//  ResultModel.swift
//  MobilKansizlik
//
//  Created by Enes urkan on 9.12.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import Foundation
import ObjectMapper

class ResultModel : NSObject, Mappable{
    
    var news : [NewsModel]?
    
    override init() {
        super .init()
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        news <- map["News"]
    }
    
    
}
