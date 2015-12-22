//
//  PaginableRequest.swift
//  Movieland
//
//  Created by Oscar Duran on 18/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

private let DefaultPaginableRequestLimit = 10

struct PaginableRequest {
    
    /// Get the page for the request
    let page: Int
    
    /// Get the amount of items to get for the page request
    let limit: Int
    
    init(page: Int) {
        self.init(page: page, limit: DefaultPaginableRequestLimit)
    }
    
    init(page: Int, limit: Int) {
        self.page = page
        self.limit = DefaultPaginableRequestLimit
    }
}