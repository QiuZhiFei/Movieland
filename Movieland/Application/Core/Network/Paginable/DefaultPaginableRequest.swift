//
//  DefaultPaginableRequest.swift
//  Movieland
//
//  Created by Oscar Duran on 18/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

private let DefaultPaginableRequestLimit = 10

struct DefaultPaginableRequest: PaginableRequest {
    
    var page: Int
    var limit: Int
    
    init(page: Int) {
        self.init(page: page, limit: DefaultPaginableRequestLimit)
    }
    
    init(page: Int, limit: Int) {
        self.page = page
        self.limit = DefaultPaginableRequestLimit
    }
}