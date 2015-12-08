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
    
    init(searchDataSourceProvider: TMDBMovieMediaServiceSearchApiDataSourceProvider) {
        self.searchDataSourceProvider = searchDataSourceProvider
    }
    
    func search(query: String, searchResults: MovieMediaServiceSearchResult) {
        searchDataSourceProvider.dataSource().search(query, searchResults: searchResults)
    }
}