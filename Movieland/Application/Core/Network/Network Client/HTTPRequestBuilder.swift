//
//  HTTPRequestBuilder.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

protocol HTTPRequestBuilder {
    /**
     Build the request
     
     - parameter method: request method
     - parameter url:  url to make the request
     
     - returns: HTTP request instance
     */
    func build(with method: HTTPRequestMethod, url: NSURL) -> HTTPRequest
    
    /**
     Generate the NSURLRequest with all the information for the request
     
     - parameter method:     request method
     - parameter url:        url to make the request
     - parameter parameters: list of http parameters
     - parameter headers:    dictionary with the request headers
     - parameter body:       body with extra data for the request (optional)
     
     - returns: a new initialized NSURLRequest instance
     */
    func generateURLRequest(method: HTTPRequestMethod, url: NSURL, parameters: [String: AnyObject], headers: [String: String], body: NSData?) -> NSURLRequest
}