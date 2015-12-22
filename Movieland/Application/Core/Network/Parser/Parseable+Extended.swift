//
//  Parseable+Extended.swift
//  Movieland
//
//  Created by Oscar Duran on 14/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Parseable {

    /**
     Parse dictionary items into Model objects
     
     - parameter element: dictionary input
     - parameter key:     dictionary sub-key value
     
     - returns: a new list of parsed Model objects
     */
    func parse<T where T: Model>(element: [String: AnyObject], key: String) -> [T] {
        
        let json = JSON(element)
 
        return json[key].arrayObject!.map({ (item) -> T in
            return parse(item as! [String : AnyObject])
        })
    }
    
    /**
     Parse a list of elements
     
     - parameter elements: list of items to parse
     
     - returns: a new list of parsed Model objects
     */
    func parse<T, E where T: Model, E: AnyObject>(elements: E) -> [T] {
        
        let json = JSON(elements)
        
        return json.arrayValue.map { (item) in
            return parse(item.dictionaryObject!)
        }
    }
}