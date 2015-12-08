//
//  HTTPResponse.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

protocol HTTPResponse {
    var urlRequest: NSURLRequest? { get }
    var httpUrlResponse: NSHTTPURLResponse? { get }
    var data: NSData? { get }
    var error: NSError? { get }
    var json: [String: AnyObject] { get }
}