//
//  Movie.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct Movie {

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
    let genres: [MovieGenre]
    let originalLanguage: String
    let hasVideo: Bool
    let isAdultVideo: Bool
    let budget: Int
    let revenue: Int
    let runtime: Int
    let homepage: String
    let imdbId: String
    let status: String
    let tagline: String
    let productionCompanies: [MovieProductionCompany]
    let productionCountries: [MovieProductionCountry]
    let spokenLanguages: [MovieSpokenLanguage]
}
