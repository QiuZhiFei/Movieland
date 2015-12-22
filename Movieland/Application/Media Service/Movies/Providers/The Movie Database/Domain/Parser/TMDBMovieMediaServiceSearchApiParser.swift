//
//  TMDBMovieMediaServiceSearchApiParser.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation
import SwiftyJSON

private struct JSONKeys {
    static let results = "results"
    static let id = "id"
    static let title = "title"
    static let originalTitle = "original_title"
    static let overview = "overview"
    static let popularity = "popularity"
    static let posterPath = "poster_path"
    static let backdropPath = "backdrop_path"
    static let releaseDate = "release_date"
    static let voteAverage = "vote_average"
    static let voteCount = "vote_count"
    static let genreIds = "genre_ids"
    static let originalLanguage = "original_language"
    static let video = "video"
}

struct TMDBMovieMediaServiceSearchApiParser: Parseable {
    
    func parse<T where T : Model>(element: [String : AnyObject]) -> T {
        
        let json = JSON(element)
        
        let id = json[JSONKeys.id].stringValue
        let title = json[JSONKeys.title].stringValue
        let originalTitle = json[JSONKeys.originalTitle].stringValue
        let overview = json[JSONKeys.overview].stringValue
        let popularity = json[JSONKeys.popularity].doubleValue
        let posterPath = json[JSONKeys.posterPath].stringValue
        let backdropPath = json[JSONKeys.backdropPath].stringValue
        let releaseDate = json[JSONKeys.releaseDate].stringValue
        let voteAverage = json[JSONKeys.voteAverage].doubleValue
        let voteCount = json[JSONKeys.voteCount].intValue
        let genreIds = json[JSONKeys.genreIds].arrayValue.map { (ids) -> Int in
            return ids.intValue
        }
        let originalLanguage = json[JSONKeys.originalLanguage].stringValue
        let video = json[JSONKeys.video].boolValue
        
        return TMDBMovieSearchResultApiModel(
            id: id,
            title: title,
            originalTitle: originalTitle,
            overview: overview,
            popularity: popularity,
            posterPath: posterPath,
            backdropPath: backdropPath,
            releaseDate: releaseDate,
            voteAverage: voteAverage,
            voteCount: voteCount,
            genreIds: genreIds,
            originalLanguage: originalLanguage,
            video: video
        ) as! T
    }
}