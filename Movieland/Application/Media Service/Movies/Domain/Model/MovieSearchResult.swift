//
//  MovieSearchResult.swift
//  Movieland
//
//  Created by Oscar Duran on 13/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct MovieSearchResult {

    let id: String
    let title: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let backdropPath: String
    let releaseDate: NSDate?
    let voteAverage: Double
    let voteCount: Int
    let genreIds: [Int]
    let originalLanguage: String
    let hasVideo: Bool
}