//
//  TMDBMovieMediaServiceMovieApiToDomainMapper.swift
//  Movieland
//
//  Created by Oscar Duran on 15/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct TMDBMovieMediaServiceMovieApiToDomainMapper: Mappable {
    
    let dateFormatter: Formateable
    let genreMapper: Mappable
    let productionCompanyMapper: Mappable
    let productionCountryMapper: Mappable
    let spokenLanguageMapper: Mappable
    
    init(dateFormatter: Formateable,
        genreMapper: Mappable,
        productionCompanyMapper: Mappable,
        productionCountryMapper: Mappable,
        spokenLanguageMapper: Mappable)
    {
        self.dateFormatter = dateFormatter
        self.genreMapper = genreMapper
        self.productionCompanyMapper = productionCompanyMapper
        self.productionCountryMapper = productionCountryMapper
        self.spokenLanguageMapper = spokenLanguageMapper
    }
    
    func mapObject<F, T>(from objectToMap: F) -> T {
        
        let from = objectToMap as! TMDBMovieApiModel
        
        var releaseDate: NSDate?
        
        if let formattedReleaseDate: NSDate = dateFormatter.format(from.releaseDate) {
            releaseDate = formattedReleaseDate
        }
        
        let genres: [MovieGenre] = from.genres.map { (item) -> MovieGenre in
            return self.genreMapper.mapObject(from: item)
        }
        
        let productionCompanies: [MovieProductionCompany] = from.productionCompanies.map { (item) -> MovieProductionCompany in
            return self.productionCompanyMapper.mapObject(from: item)
        }
        
        let productionCountries: [MovieProductionCountry] = from.productionCountries.map { (item) -> MovieProductionCountry in
            return self.productionCountryMapper.mapObject(from: item)
        }
        
        let spokenLanguages: [MovieSpokenLanguage] = from.spokenLanguages.map { (item) -> MovieSpokenLanguage in
            return self.spokenLanguageMapper.mapObject(from: item)
        }
        
        return Movie(
            id: from.id,
            title: from.title,
            originalTitle: from.originalTitle,
            overview: from.overview,
            popularity: from.popularity,
            posterPath: from.posterPath,
            backdropPath: from.backdropPath,
            releaseDate: releaseDate,
            voteAverage: from.voteAverage,
            voteCount: from.voteCount,
            genres: genres,
            originalLanguage: from.originalLanguage,
            hasVideo: from.video,
            isAdultVideo: from.adult,
            budget: from.budget,
            revenue: from.revenue,
            runtime: from.runtime,
            homepage: from.homepage,
            imdbId: from.imdbId,
            status: from.status,
            tagline: from.tagline,
            productionCompanies: productionCompanies,
            productionCountries: productionCountries,
            spokenLanguages: spokenLanguages
        ) as! T
    }
}
