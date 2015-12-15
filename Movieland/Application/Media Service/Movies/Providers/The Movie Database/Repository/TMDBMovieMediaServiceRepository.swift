//
//  TMDBMovieMediaServiceRepository.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct TMDBMovieMediaServiceRepository: MovieMediaService {
    
    let searchDataSourceProvider: TMDBMovieMediaServiceSearchApiDataSourceProvider
    let getMovieByIdDataSourceProvider: TMDBMovieMediaServiceGetMovieByIdApiDataSourceProvider
    
    init(searchDataSourceProvider: TMDBMovieMediaServiceSearchApiDataSourceProvider,
        getMovieByIdDataSourceProvider: TMDBMovieMediaServiceGetMovieByIdApiDataSourceProvider)
    {
        self.searchDataSourceProvider = searchDataSourceProvider
        self.getMovieByIdDataSourceProvider = getMovieByIdDataSourceProvider
    }
    
    func search(query: String, searchResults: MovieMediaServiceSearchResult) {
        searchDataSourceProvider.dataSource().search(query, searchResults: searchResults)
    }
    
    func getMovieById(movieId: String, movieResult: MovieMediaServiceMovieByIdResult) {
        getMovieByIdDataSourceProvider.dataSource().getMovieById(movieId, movieResult: movieResult)
    }
}