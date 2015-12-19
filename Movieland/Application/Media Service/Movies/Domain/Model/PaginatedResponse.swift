//
//  PaginatedResponse.swift
//  Movieland
//
//  Created by Oscar Duran on 19/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct PaginatedResponse<T>: Paginable {
    
    var currentPage: Int
    var hasNextPage: Bool
    var totalPages: Int
    var totalResults: Int
    var items: [T]
}