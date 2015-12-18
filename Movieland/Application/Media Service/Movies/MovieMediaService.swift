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
typealias MovieMediaServiceMovieListResult = Result<[MovieSearchResult], NSError> -> ()

/**
 - NowPlaying: Get the list of movies playing that have been, or are being released this week
 - Popular:    Get the list of popular movies
 - TopRated:   Get the list of top rated movies
 - Upcoming:   Get the list of upcoming movies by release date
 */
enum MovieMediaServiceMode {
    case NowPlaying
    case Popular
    case TopRated
    case Upcoming
}

/**
 *  The Movie Media Service it's a protocol for implementing different "movies service" like 
 *  The Movie Data Base, IMDB, etc. Just write your own implementation and you're ready to go 👊🏽
 */
protocol MovieMediaService {
    
    /**
     Search for movies by title
     
     - parameter query:         movie title
     - parameters:              extra parameters for filtering the movies
     - parameter searchResults: MovieMediaServiceSearchResult
     */
    func search(query: String, parameters: QueryParameters?, searchResults: MovieMediaServiceSearchResult)
    
    /**
     Get the basic movie information for a specific movie id
     
     - parameter movieId:     movie identifier
     - parameter movieResult: MovieMediaServiceMovieByIdResult
     */
    func getMovieById(movieId: String, movieResult: MovieMediaServiceMovieByIdResult)
    
    /**
     Get the list of movies by mode (popular, top rated, etc)
     
     - parameter mode:            MovieMediaServiceMode
     - parameters:                extra parameters for filtering the movies
     - parameter movieListResult: MovieMediaServiceMovieListResult
     */
    func getMovies(mode: MovieMediaServiceMode, parameters: QueryParameters?, movieListResult: MovieMediaServiceMovieListResult)
}