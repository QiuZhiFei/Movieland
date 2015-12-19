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
    let queryComposer: RequestQueryComposer
    let paginatedResponseComposer: TMDBMovieResultPaginatedResponseComposer
    
    init(httpClient: HTTPClient,
        parser: Parseable,
        mapper: Mappable,
        queryComposer: RequestQueryComposer,
        paginatedResponseComposer: TMDBMovieResultPaginatedResponseComposer)
    {
        self.httpClient = httpClient
        self.parser = parser
        self.mapper = mapper
        self.queryComposer = queryComposer
        self.paginatedResponseComposer = paginatedResponseComposer
    }
    
    func search(query: String, parameters: QueryParameters?, searchResults: MovieMediaServiceSearchResult) {
        
        let path = TMDBMovieMediaServiceApiDefinition.Search.path
        var request = httpClient.GET(path).parameters([
            Parameters.query : query
        ])
        
        request = queryComposer.compose(
            request,
            parameters: parameters
        )

        httpClient.execute(request) { (requestResult) in

            guard let response = requestResult.value else {
                searchResults(
                    Result.Failure(requestResult.error!)
                )
                return
            }
            
            let movieSearchResults: [TMDBMovieSearchResultApiModel] = self.parser.parse(response.json, key: "results")
            let mappedMovieSearchResults: [MovieSearchResult] = movieSearchResults.map {
                return self.mapper.mapObject(from: $0)
            }

            let paginatedResponse = self.paginatedResponseComposer.paginate(
                response,
                items: mappedMovieSearchResults
            )
            
            searchResults(
                Result.Success(paginatedResponse)
            )
        }
    }
}