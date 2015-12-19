//
//  TMDBMovieMediaServiceGetMoviesByModeApiDataSource.swift
//  Movieland
//
//  Created by Oscar Duran on 16/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation
import Result

extension MovieMediaServiceMode {
    var path: String {
        switch self {
        case .NowPlaying:
            return "now_playing"
        case .Popular:
            return "popular"
        case .TopRated:
            return "top_rated"
        case .Upcoming:
            return "upcoming"
        }
    }
}

protocol TMDBMovieMediaServiceGetMoviesByModeApiDataSourceProvider {
    func dataSource() -> TMDBMovieMediaServiceGetMoviesByModeApiDataSource
}

struct TMDBMovieMediaServiceGetMoviesByModeApiDataSource {
    
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
    
    func getMovies(mode: MovieMediaServiceMode, parameters: QueryParameters?, movieListResult: MovieMediaServiceMovieListResult) {
        
        let path = TMDBMovieMediaServiceApiDefinition.GetMoviesByMode(mode: mode.path).path
        var request = httpClient.GET(path)
        
        request = queryComposer.compose(
            request,
            parameters: parameters
        )
        
        httpClient.execute(request) { (requestResult) in
            
            guard let response = requestResult.value else {
                movieListResult(
                    Result.Failure(requestResult.error!)
                )
                return
            }

            let movieList: [TMDBMovieSearchResultApiModel] = self.parser.parse(response.json, key: "results")
            let mappedMovieList: [MovieSearchResult] = movieList.map {
                return self.mapper.mapObject(from: $0)
            }
            
            let paginatedResponse = self.paginatedResponseComposer.paginate(
                response,
                items: mappedMovieList
            )
            
            movieListResult(
                Result.Success(paginatedResponse)
            )
        }
    }
}