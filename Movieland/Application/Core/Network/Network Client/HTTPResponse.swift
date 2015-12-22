//
//  HTTPResponse.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct HTTPResponse {
    
    let urlRequest: NSURLRequest?
    let httpUrlResponse: NSHTTPURLResponse?
    let data: NSData?
    let error: NSError?
    let json: [String: AnyObject]
}