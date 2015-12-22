//
//  Formateable.swift
//  Movieland
//
//  Created by Oscar Duran on 13/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

/**
 *  Defines a contract for formatting information like date, pounds, money, etc
 */
protocol Formateable {
    
    /**
     Formats information
     
     - parameter input: input information
     
     - returns: returns a formatted input
     */
    func format<I, O>(input: I) -> O?
}