//
//  TMDBMovieApiModel.swift
//  Movieland
//
//  Created by Oscar Duran on 14/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct TMDBMovieApiModel: Model {
    
    let id: String
    let title: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let backdropPath: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
    let genres: [TMDBMovieGenreApiModel]
    let originalLanguage: String
    let video: Bool
    let adult: Bool
    let budget: Int
    let revenue: Int
    let runtime: Int
    let homepage: String
    let imdbId: String
    let status: String
    let tagline: String
    let productionCompanies: [TMDBMovieProductionCompanyApiModel]
    let productionCountries: [TMDBMovieProductionCountryApiModel]
    let spokenLanguages: [TMDBMovieSpokenLanguageApiModel]
}