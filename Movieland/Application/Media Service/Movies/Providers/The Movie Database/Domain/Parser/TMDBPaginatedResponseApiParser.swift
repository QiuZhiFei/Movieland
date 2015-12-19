//
//  TMDBPaginatedResponseApiParser.swift
//  Movieland
//
//  Created by Oscar Duran on 19/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation
import SwiftyJSON

private struct JSONKeys {
    static let page = "page"
    static let totalPages = "total_pages"
    static let totalResults = "total_results"
}

struct TMDBPaginatedResponseParser: Parseable {
    
    func parse<T where T : Model>(element: [String : AnyObject]) -> T {
        
        let json = JSON(element)
        
        let page = json[JSONKeys.page].intValue
        let totalPages = json[JSONKeys.totalPages].intValue
        let totalResults = json[JSONKeys.totalResults].intValue
        
        return TMDBPaginatedResponseApiModel(
            page: page,
            totalPages: totalPages,
            totalResults: totalResults
        ) as! T
    }
}