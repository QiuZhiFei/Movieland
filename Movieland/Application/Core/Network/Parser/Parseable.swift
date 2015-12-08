//
//  Parseable.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

/**
 Defines contract for parsing elements from dictionaries and arrays
 */
protocol Parseable {
    
    /**
     Parse dictionary into Model object
     
     - parameter element: dictionary input
     
     - returns: a new parsed Model object
     */
    func parse<T where T: Model>(element: [String: AnyObject]) -> T
    
    /**
     Parse a list of elements
     
     - parameter elements: list of dictionaries to parse
     
     - returns: a new list of parsed Model objects
     */
    func parseArray<T where T: Model>(elements: [String: AnyObject]) -> [T]
}