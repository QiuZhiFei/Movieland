//
//  PaginableRequest.swift
//  Movieland
//
//  Created by Oscar Duran on 18/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

protocol PaginableRequest {
    
    /// Get the page for the request
    var page: Int { get }
    
    /// Get the amount of items to get for the page request
    var limit: Int { get }
}