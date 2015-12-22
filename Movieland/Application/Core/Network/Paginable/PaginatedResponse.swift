//
//  PaginatedResponse.swift
//  Movieland
//
//  Created by Oscar Duran on 19/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct PaginatedResponse<T> {
    
    /// Get the current page for the request
    let currentPage: Int
    
    /// Check if there are more pages to keep paginating
    let hasNextPage: Bool
    
    /// Get the total number of available pages
    let totalPages: Int
    
    /// Get the total number of items in the collection
    let totalResults: Int
    
    /// Get the items being paginated
    let items: [T]
}