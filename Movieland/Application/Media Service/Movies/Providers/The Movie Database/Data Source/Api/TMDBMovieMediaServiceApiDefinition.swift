//
//  TMDBMovieMediaServiceApiDefinition.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

enum TMDBMovieMediaServiceApiDefinition {
    case ApiBaseUrl
    case Search
    case GetMovieById(movieId: String)
}

extension TMDBMovieMediaServiceApiDefinition {
    var path: String {
        
        switch self {
        case .ApiBaseUrl:
            return "https://api.themoviedb.org/3/"
        case .Search:
            return "search/movie"
        case .GetMovieById(let movieId):
            return "movie/\(movieId)"
        }
    }
}