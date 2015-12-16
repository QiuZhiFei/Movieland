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
    
    init(httpClient: HTTPClient,
        parser: Parseable,
        mapper: Mappable)
    {
        self.httpClient = httpClient
        self.parser = parser
        self.mapper = mapper
    }
    
    func getMovies(mode: MovieMediaServiceMode, movieListResult: MovieMediaServiceMovieListResult) {
        
        let path = TMDBMovieMediaServiceApiDefinition.GetMoviesByMode(mode: mode.path).path
        let request = httpClient.GET(path)
        
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
            
            movieListResult(
                Result.Success(mappedMovieList)
            )
        }
    }
}