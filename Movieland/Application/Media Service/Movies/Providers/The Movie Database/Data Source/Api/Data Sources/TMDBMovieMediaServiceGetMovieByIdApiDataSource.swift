//
//  TMDBMovieMediaServiceGetMovieByIdApiDataSource.swift
//  Movieland
//
//  Created by Oscar Duran on 14/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation
import Result

protocol TMDBMovieMediaServiceGetMovieByIdApiDataSourceProvider {
    func dataSource() -> TMDBMovieMediaServiceGetMovieByIdApiDataSource
}

struct TMDBMovieMediaServiceGetMovieByIdApiDataSource {
    
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
    
    func getMovieById(movieId: String, movieResult: MovieMediaServiceMovieByIdResult) {
        
        let path = TMDBMovieMediaServiceApiDefinition.GetMovieById(movieId: movieId).path
        let request = httpClient.GET(path)
        
        httpClient.execute(request) { (requestResult) in
            
            guard let response = requestResult.value else {
                movieResult(
                    Result.Failure(requestResult.error!)
                )
                return
            }

            let movie: TMDBMovieApiModel = self.parser.parse(response.json)
            let mappedMovie: Movie = self.mapper.mapObject(from: movie)
            
            movieResult(
                Result.Success(mappedMovie)
            )
        }
    }
}