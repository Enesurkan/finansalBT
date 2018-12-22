//
//  BaseService.swift
//  TestExample
//
//  Created by Busra Filgir on 4.12.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BaseService: NSObject {
    
    static var baseUrl : String = "http://private-1d2e43-enes1.apiary-mock.com/"
    
    static func get(url:URLConvertible, parameters:Parameters?, success:@escaping (_ responseData:Data?) -> Void, failure:@escaping (_ error:Error?) -> Void) -> Void {
        
        self.get(url: url, parameters: parameters, encoding: JSONEncoding.default, headers: nil, success:success, failure:failure)
    }
    
    static func get(url:URLConvertible, parameters:Parameters?, encoding:ParameterEncoding, headers:[String:String]?, success:@escaping (_ responseData:Data?) -> Void, failure:@escaping (_ error:Error?) -> Void) -> Void {
        var header : [String:String] = [:]
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: encoding, headers: header).validate(statusCode:200..<300).responseData { (response) in
            if response.result.isSuccess
            {
                let responseData : Data? = response.result.value
                do{
                    if let data = response.data {
                        let responseJSON = try JSON(data: data)
                        if let message: String = responseJSON["errorMessage"].string
                        {
                            if !message.isEmpty
                            {
                                failure(response.result.error)
                            }
                            else
                            {
                                success(responseData)
                            }
                        }
                        else
                        {
                            success(responseData)
                            
                        }
                    }
                    
                }
                catch
                {
                    success(responseData)
                    
                }
                
            }
            else if response.result.isFailure
            {
                failure(response.result.error)
            }
        }
    }
}



