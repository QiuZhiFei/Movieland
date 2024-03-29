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
    let getMoviesByModeDataSourceProvider: TMDBMovieMediaServiceGetMoviesByModeApiDataSourceProvider
    
    init(searchDataSourceProvider: TMDBMovieMediaServiceSearchApiDataSourceProvider,
        getMovieByIdDataSourceProvider: TMDBMovieMediaServiceGetMovieByIdApiDataSourceProvider,
        let getMoviesByModeDataSourceProvider: TMDBMovieMediaServiceGetMoviesByModeApiDataSourceProvider)
    {
        self.searchDataSourceProvider = searchDataSourceProvider
        self.getMovieByIdDataSourceProvider = getMovieByIdDataSourceProvider
        self.getMoviesByModeDataSourceProvider = getMoviesByModeDataSourceProvider
    }
    
    func search(query: String, parameters: QueryParameters?, searchResults: MovieMediaServiceSearchResult) {
        searchDataSourceProvider.dataSource().search(query, parameters: parameters, searchResults: searchResults)
    }
    
    func getMovieById(movieId: String, movieResult: MovieMediaServiceMovieByIdResult) {
        getMovieByIdDataSourceProvider.dataSource().getMovieById(movieId, movieResult: movieResult)
    }
    
    func getMovies(mode: MovieMediaServiceMode, parameters: QueryParameters?, movieListResult: MovieMediaServiceMovieListResult) {
        getMoviesByModeDataSourceProvider.dataSource().getMovies(mode, parameters: parameters, movieListResult: movieListResult)
    }
}