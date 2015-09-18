//
//  Qualification+Request.swift
//  Gojimo
//
//  Created by Roger TAN on 14/09/15.
//  Copyright © 2015 Roger TAN. All rights reserved.
//

import Foundation
import Alamofire

extension Qualification {
    
    /**
    Fetches all of `Qualification` objects with the current data from the server *asynchrosnously* and calls the given block
    
    :param: completion  A block object to be executed when the data is fetched from the server.
    */
    internal class func fetchAll(completionHandler: (qualifications: [Qualification]?, error: NSError?) -> Void) {
        Alamofire.request(.GET, "https://api.gojimo.net/api/v4/qualifications")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON(completionHandler: { (request:NSURLRequest?, response:NSURLResponse?, result: Result<AnyObject>) -> Void in
                if result.isSuccess {
                    if result.value is NSArray {
                        var qualifications = [Qualification]()
                        if let objects = result.value as? [NSDictionary] {
                            for qualification in objects {
                                let object = Qualification(dictionary: qualification as [NSObject : AnyObject])
                                qualifications.append(object)
                            }
                        }
                        completionHandler(qualifications: qualifications, error: nil)
                    }
                } else {
                    completionHandler(qualifications: nil, error: nil)
                }
            })
    }
}