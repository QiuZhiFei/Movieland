//
//  Mappable.swift
//  Movieland
//
//  Created by Oscar Duran on 13/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

/**
 Defines a contract for mapping from one object to another
 */
protocol Mappable {
    
    /**
     Maps an object into another object type
     
     - parameter objectToMap: the source object to be mapped
     
     - returns: a new mapped object instance
     */
    func mapObject<F, T>(from objectToMap: F) -> T
}