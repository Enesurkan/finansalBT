//
//  Reachability.swift
//  MobilKansizlik
//
//  Created by EnesUrkan on 19.12.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkState {
    
    var isConnected : Bool {
        return NetworkReachabilityManager(host:"www.apple.com")!.isReachable
    }
    
}
