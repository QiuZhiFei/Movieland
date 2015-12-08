//
//  HTTPProcessor.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

/**
 *  HTTP processor that will be executed before making the request
 */
protocol HTTPRequestProcessor {
    
    /**
     Process the request before sending any data to the server (here you can add custom headers, auth, etc)
     
     - parameter request: request to be modified
     
     - returns: a new modified request
     */
    func processRequest(request: HTTPRequest) -> HTTPRequest
}

/**
 *  HTTP processor that will be executed after executing a successful request
 */
protocol HTTPResponseProcessor {
    
    /**
     Process a successful response (here you can add, convert, extract, modify the response)
     
     - parameter response: response to be modified
     
     - returns: a new modified response
     */
    func processResponse(response: HTTPResponse) -> HTTPResponse
}

/**
 *  HTTP processor that will be executed when the request failed
 */
protocol HTTPErrorProcessor {
    
    /**
     Process a failed response (here you can parse the error and check if it's an api error etc)
     
     - parameter request:  failed request
     - parameter response: response with the information from the server
     
     - returns: a domain error for your request
     */
    func processError(request: HTTPRequest, response: HTTPResponse) -> NSError
}