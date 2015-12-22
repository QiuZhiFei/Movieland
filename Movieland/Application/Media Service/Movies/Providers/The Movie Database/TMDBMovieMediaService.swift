//
//  TMDBMovieMediaService.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct TMDBMovieMediaService: MovieMediaService {
    
    let repository: MovieMediaService
    
    init(repository: MovieMediaService) {
        self.repository = repository
    }
    
    func search(query: String, parameters: QueryParameters?, searchResults: MovieMediaServiceSearchResult) {
        repository.search(query, parameters: parameters, searchResults: searchResults)
    }
    
    func getMovieById(movieId: String, movieResult: MovieMediaServiceMovieByIdResult) {
        repository.getMovieById(movieId, movieResult: movieResult)
    }
    
    func getMovies(mode: MovieMediaServiceMode, parameters: QueryParameters?, movieListResult: MovieMediaServiceMovieListResult) {
        repository.getMovies(mode, parameters: parameters, movieListResult: movieListResult)
    }
}