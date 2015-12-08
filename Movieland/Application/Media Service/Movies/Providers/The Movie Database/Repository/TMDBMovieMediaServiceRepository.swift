//
//  TMDBMovieMediaServiceRepository.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct TMDBMovieMediaServiceRepository: MovieMediaService {
    
    let dataSource: MovieMediaService
    
    init(dataSource: MovieMediaService) {
        self.dataSource = dataSource
    }
    
    func search(query: String, searchResults: MovieMediaServiceSearchResult) {
        dataSource.search(query, searchResults: searchResults)
    }
}