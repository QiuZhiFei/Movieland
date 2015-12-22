//
//  AlamofireHTTPRequest.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct AlamofireHTTPRequest: HTTPRequest {
    
    var identifier: String
    var httpRequestMethod: HTTPRequestMethod
    var url: NSURL
    var parameters: [String: AnyObject]
    var headers: [String: String]
    var body: NSData?
    
    init(httpRequestMethod: HTTPRequestMethod, url: NSURL) {
        self.identifier = NSUUID().UUIDString
        self.httpRequestMethod = httpRequestMethod
        self.url = url
        self.parameters = [:]
        self.headers = [:]
        self.body = nil
    }
    
    private init(identifier: String,
        httpRequestMethod: HTTPRequestMethod,
        url: NSURL,
        parameters: [String: AnyObject],
        headers: [String: String],
        body: NSData?)
    {
        self.identifier = identifier
        self.httpRequestMethod = httpRequestMethod
        self.url = url
        self.parameters = parameters
        self.headers = headers
        self.body = body
    }
    
    func parameters(parameters: [String : AnyObject]) -> HTTPRequest {
        let newParameters = self.parameters.union(parameters)
        
        return AlamofireHTTPRequest(
            identifier: identifier,
            httpRequestMethod: httpRequestMethod,
            url: url,
            parameters: newParameters,
            headers: headers,
            body: body
        )
    }
    
    func headers(headers: [String : String]) -> HTTPRequest {
        let newHeaders = self.headers.union(headers)
        
        return AlamofireHTTPRequest(
            identifier: identifier,
            httpRequestMethod: httpRequestMethod,
            url: url,
            parameters: parameters,
            headers: newHeaders,
            body: body
        )
    }
    
    func body(data: NSData?) -> HTTPRequest {
        return AlamofireHTTPRequest(
            identifier: identifier,
            httpRequestMethod: httpRequestMethod,
            url: url,
            parameters: parameters,
            headers: headers,
            body: data
        )
    }
}