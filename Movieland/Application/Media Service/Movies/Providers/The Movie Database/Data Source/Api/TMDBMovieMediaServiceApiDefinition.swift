//
//  TMDBMovieMediaServiceApiDefinition.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

enum TMDBMovieMediaServiceApiDefinition {
    
    case Search(query: String)
}

extension TMDBMovieMediaServiceApiDefinition {
    var path: String {
        
        switch self {
        case .Search(let query):
            return "search/movie?query=\(query)"
        }
    }
}