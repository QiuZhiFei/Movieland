//
//  AlamofireHTTPRequestBuilder.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation
import Alamofire

struct AlamofireHTTPRequestBuilder: HTTPRequestBuilder {
    
    func build(with method: HTTPRequestMethod, url: NSURL) -> HTTPRequest {
        return AlamofireHTTPRequest(httpRequestMethod: method, url: url)
    }
    
    func generateURLRequest(method: HTTPRequestMethod,
        url: NSURL,
        parameters: [String : AnyObject],
        headers: [String : String],
        body: NSData?) -> NSURLRequest
    {
        let mutableRequest = NSMutableURLRequest(URL: url)
        
        for (field, value) in headers {
            mutableRequest.setValue(value, forHTTPHeaderField: field)
        }
        
        let parsedParameters: [String: AnyObject]? = (parameters.count > 0) ? parameters : nil
        
        mutableRequest.HTTPBody = body
        mutableRequest.HTTPMethod = method.rawValue
        
        return Alamofire.ParameterEncoding.URL.encode(
            mutableRequest,
            parameters: parsedParameters
        ).0
    }
}