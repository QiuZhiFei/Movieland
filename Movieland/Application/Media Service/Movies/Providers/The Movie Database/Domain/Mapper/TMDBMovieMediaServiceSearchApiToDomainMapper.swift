//
//  TMDBMovieMediaServiceSearchApiToDomainMapper.swift
//  Movieland
//
//  Created by Oscar Duran on 13/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct TMDBMovieMediaServiceSearchApiToDomainMapper: Mappable {
    
    func mapObject<F, T>(from objectToMap: F) -> T {
        
        let from = objectToMap as! TMDBMovieSearchResultApiModel
        
        return MovieSearchResult(
            id: from.id,
            title: from.title,
            originalTitle: from.originalTitle,
            overview: from.overview,
            popularity: from.popularity,
            posterPath: from.posterPath,
            backdropPath: from.backdropPath,
            releaseDate: NSDate(),
            voteAverage: from.voteAverage,
            voteCount: from.voteCount,
            genreIds: from.genreIds,
            originalLanguage: from.originalLanguage,
            hasVideo: from.video
        ) as! T
    }
}