//
//  TMDBMovieMediaServiceMovieApiParser.swift
//  Movieland
//
//  Created by Oscar Duran on 14/12/15.
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
    static let genres = "genres"
    static let originalLanguage = "original_language"
    static let video = "video"
    static let adult = "adult"
    static let budget = "budget"
    static let revenue = "revenue"
    static let runtime = "runtime"
    static let homepage = "homepage"
    static let imdbId = "imdb_id"
    static let status = "status"
    static let tagline = "tagline"
    static let productionCompanies = "production_companies"
    static let productionCountries = "production_countries"
    static let spokenLanguages = "spoken_languages"
}

struct TMDBMovieMediaServiceMovieApiParser: Parseable {
    
    let genreParser: Parseable
    let productionCompanyParser: Parseable
    let productionCountryParser: Parseable
    let spokenLanguageParser: Parseable

    init(genreParser: Parseable,
        productionCompanyParser: Parseable,
        productionCountryParser: Parseable,
        spokenLanguageParser: Parseable)
    {
        self.genreParser = genreParser
        self.productionCompanyParser = productionCompanyParser
        self.productionCountryParser = productionCountryParser
        self.spokenLanguageParser = spokenLanguageParser
    }
    
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
        let genres: [TMDBMovieGenreApiModel] = self.genreParser.parse(
            json[JSONKeys.genres].object
        )
        let originalLanguage = json[JSONKeys.originalLanguage].stringValue
        let video = json[JSONKeys.video].boolValue
        let adult = json[JSONKeys.adult].boolValue
        let budget = json[JSONKeys.budget].intValue
        let revenue = json[JSONKeys.revenue].intValue
        let runtime = json[JSONKeys.runtime].intValue
        let homepage = json[JSONKeys.homepage].stringValue
        let imdbId = json[JSONKeys.imdbId].stringValue
        let status = json[JSONKeys.status].stringValue
        let tagline = json[JSONKeys.tagline].stringValue
        let productionCompanies: [TMDBMovieProductionCompanyApiModel] = self.productionCompanyParser.parse(
            json[JSONKeys.productionCompanies].object
        )
        let productionCountries: [TMDBMovieProductionCountryApiModel] = self.productionCountryParser.parse(
            json[JSONKeys.productionCountries].object
        )
        let spokenLanguages: [TMDBMovieSpokenLanguageApiModel] = self.spokenLanguageParser.parse(
            json[JSONKeys.spokenLanguages].object
        )
        
        return TMDBMovieApiModel(
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
            genres: genres,
            originalLanguage: originalLanguage,
            video: video,
            adult: adult,
            budget: budget,
            revenue: revenue,
            runtime: runtime,
            homepage: homepage,
            imdbId: imdbId,
            status: status,
            tagline: tagline,
            productionCompanies: productionCompanies,
            productionCountries: productionCountries,
            spokenLanguages: spokenLanguages
        ) as! T
    }
}