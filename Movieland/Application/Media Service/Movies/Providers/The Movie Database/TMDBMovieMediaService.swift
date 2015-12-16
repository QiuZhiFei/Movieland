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
    
    func search(query: String, searchResults: MovieMediaServiceSearchResult) {
        repository.search(query, searchResults: searchResults)
    }
    
    func getMovieById(movieId: String, movieResult: MovieMediaServiceMovieByIdResult) {
        repository.getMovieById(movieId, movieResult: movieResult)
    }
    
    func getMovies(mode: MovieMediaServiceMode, movieListResult: MovieMediaServiceMovieListResult) {
        repository.getMovies(mode, movieListResult: movieListResult)
    }
}