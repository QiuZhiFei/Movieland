//
//  HTTPClient.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation
import Result

/// Result with all the information about the request response
typealias HTTPResult = Result<HTTPResponse, NSError> -> ()

/**
 Define HTTP Network client for making request to a web server
 */
protocol HTTPClient {
    
    var requestProcessors: [HTTPRequestProcessor] { get set }
    var responseProcessors: [HTTPResponseProcessor] { get set }
    var responseErrorProcessor: HTTPErrorProcessor? { get set }
    
    /**
     Initialize HTTP Network client
     
     - parameter baseURL:        base url (ex: example.com)
     - parameter requestBuilder: the request builder to generate the urls
     
     - returns: a new initialized HTTPClient instance
     */
    init(baseURL: String, requestBuilder: HTTPRequestBuilder)
    
    /**
     Execute a GET request to the server
     
     - parameter path: url path
     
     - returns: HTTP request instance
     */
    func GET(path: String) -> HTTPRequest
    
    /**
     Execute a POST request to the server
     
     - parameter path: url path
     
     - returns: HTTP request instance
     */
    func POST(path: String) -> HTTPRequest
    
    /**
     Execute a PUT request to the server
     
     - parameter path: url path
     
     - returns: HTTP request instance
     */
    func PUT(path: String) -> HTTPRequest
    
    /**
     Execute a PATCH request to the server
     
     - parameter path: url path
     
     - returns: HTTP request instance
     */
    func PATCH(path: String) -> HTTPRequest
    
    /**
     Execute a DELETE request to the server
     
     - parameter path: url path
     
     - returns: HTTP request instance
     */
    func DELETE(path: String) -> HTTPRequest
    
    /**
     Execute the network request
     
     - parameter request: Network request to execute
     - parameter result:  Network result completion
     */
    func execute(request: HTTPRequest, result: HTTPResult)
}