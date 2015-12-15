//
//  MovieMediaService.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation
import Result

typealias MovieMediaServiceMovieByIdResult = Result<Movie, NSError> -> ()
typealias MovieMediaServiceSearchResult = Result<[MovieSearchResult], NSError> -> ()

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
    
    /**
     Get the basic movie information for a specific movie id
     
     - parameter movieId:     movie identifier
     - parameter movieResult: MovieMediaServiceMovieByIdResult
     */
    func getMovieById(movieId: String, movieResult: MovieMediaServiceMovieByIdResult)
}