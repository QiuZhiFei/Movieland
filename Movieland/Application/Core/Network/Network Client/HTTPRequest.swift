//
//  HTTPRequest.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

/**
 Define http request methods
 */
enum HTTPRequestMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case PATCH = "PATCH"
    case DELETE = "DELETE"
}

/**
 *  Generate the network request with extra information (ex: headers, body, etc)
 */
protocol HTTPRequest {
    
    var identifier: String { get }
    var httpRequestMethod: HTTPRequestMethod { get }
    var url: NSURL { get }
    var parameters: [String: AnyObject] { get }
    var headers: [String: String] { get }
    var body: NSData? { get}
    
    /**
     Append a list of parameters to the request
     
     - parameter parameters: Parameter list
     
     - returns: HTTP request instance
     */
    func parameters(parameters: [String: AnyObject]) -> HTTPRequest
    
    /**
     Append a list of http headers to the request
     
     - parameter headers: Header list
     
     - returns: HTTP request instance
     */
    func headers(headers: [String: String]) -> HTTPRequest
    
    /**
     Append some data into the request
     
     - parameter body: Body data instance
     
     - returns: HTTP request instance
     */
    func body(data: NSData?) -> HTTPRequest
}