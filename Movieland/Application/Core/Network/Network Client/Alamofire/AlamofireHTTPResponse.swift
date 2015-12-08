//
//  AlamofireHTTPResponse.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct AlamofireHTTPReponse: HTTPResponse {
    
    var urlRequest: NSURLRequest?
    var httpUrlResponse: NSHTTPURLResponse?
    var data: NSData?
    var error: NSError?
    var json: [String: AnyObject]
}