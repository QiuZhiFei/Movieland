//
//  Paginable.swift
//  Movieland
//
//  Created by Oscar Duran on 18/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

protocol Paginable {
    
    typealias T
    
    /// Get the current page for the request
    var currentPage: Int { get }
    
    /// Check if there are more pages to keep paginating
    var hasNextPage: Bool { get }
    
    /// Get the total number of available pages
    var totalPages: Int { get }
    
    /// Get the total number of items in the collection
    var totalResults: Int { get }
    
    /// Get the items being paginated
    var items: [T] { get }
}