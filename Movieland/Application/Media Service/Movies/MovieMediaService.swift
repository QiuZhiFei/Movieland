//
//  MovieMediaService.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation
import Result

/// Returns a list of movies if request succeed or empty array if there are not results.
/// If request failed returns an domain error
typealias MovieMediaServiceSearchResult = Result<[Movie], NSError> -> ()

/**
 *  The Movie Media Service it's a protocol for implementing different "movies service" like 
 *  The Movie Data Base, IMDB, etc. Just write your own implementation and you're ready to go 👊🏽
 */
protocol MovieMediaService {
    
    /**
     Search for movies by title
     
     - parameter query:         movie title
     - parameter searchResults: MovieMediaServiceSearchResult
     */
    func search(query: String, searchResults: MovieMediaServiceSearchResult)
}