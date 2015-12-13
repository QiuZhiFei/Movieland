//
//  TMDBMovieMediaServiceSearchApiDataSource.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation
import Result

protocol TMDBMovieMediaServiceSearchApiDataSourceProvider {
    func dataSource() -> TMDBMovieMediaServiceSearchApiDataSource
}

private struct Parameters {
    static let query = "query"
}

struct TMDBMovieMediaServiceSearchApiDataSource {
    
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
    
    func search(query: String, searchResults: MovieMediaServiceSearchResult) {
        
        let path = TMDBMovieMediaServiceApiDefinition.Search.path
        let request = httpClient.GET(path).parameters([
            Parameters.query : query
        ])
        
        httpClient.execute(request) { (requestResult) in
            
            guard let response = requestResult.value else {
                searchResults(
                    Result.Failure(requestResult.error!)
                )
                return
            }
            
            let movieSearchResults: [TMDBMovieSearchResultApiModel] = self.parser.parseArray(response.json)
            let mappedMovieSearchResults: [MovieSearchResult] = movieSearchResults.map({ (item) -> MovieSearchResult in
                return self.mapper.mapObject(from: item)
            })
            
            print(mappedMovieSearchResults)
        }
    }
}