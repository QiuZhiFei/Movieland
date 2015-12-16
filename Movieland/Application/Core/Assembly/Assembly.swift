//
//  Assembly.swift
//  Movieland
//
//  Created by Oscar Duran on 1/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

/**
 *  Application assembly containing all the application dependencies
 */
struct Assembly {
    private static let defaultAssembly = Assembly()
    
    /**
     Prevent initializing from outside
     */
    private init() {}
}

/**
 Fetch module from assembly
 
 - returns: the default assembly
 */
func Module() -> Assembly {
    return Assembly.defaultAssembly
}