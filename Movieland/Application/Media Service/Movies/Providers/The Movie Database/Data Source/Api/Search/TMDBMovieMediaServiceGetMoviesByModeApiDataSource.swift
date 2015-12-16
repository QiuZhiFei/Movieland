//
//  TMDBMovieMediaServiceGetMoviesByModeApiDataSource.swift
//  Movieland
//
//  Created by Oscar Duran on 16/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation
import Result

protocol TMDBMovieMediaServiceGetMoviesByModeApiDataSourceProvider {
    func dataSource() -> TMDBMovieMediaServiceGetMoviesByModeApiDataSource
}

struct TMDBMovieMediaServiceGetMoviesByModeApiDataSource {
    
    let httpClient: HTTPClient
    let parser: Parseable
    let mapper: Mappable
    
    init(httpClient: HTTPClient,
        parser: Parseable,
        mapper: Mappable)
    {
        self.httpClient = httpClient
        self.parser = parser
        self.mapper = mapper
    }
    
    func getMovies(mode: MovieMediaServiceMode, movieListResult: MovieMediaServiceMovieListResult) {
    
    
    }
}