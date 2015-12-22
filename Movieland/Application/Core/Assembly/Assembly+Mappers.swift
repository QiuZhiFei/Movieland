//
//  Assembly+Mappers.swift
//  Movieland
//
//  Created by Oscar Duran on 13/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

extension Assembly {
    
    func getTMDBMovieMediaServiceSearchApiToDomainMapper() -> Mappable {
        return TMDBMovieMediaServiceSearchApiToDomainMapper(
            dateFormatter: getTMDBDateFormatter()
        )
    }
    
    func getTMDBMovieMediaServiceMovieApiToDomainMapper() -> Mappable {
        return TMDBMovieMediaServiceMovieApiToDomainMapper(
            dateFormatter: getTMDBDateFormatter(),
            genreMapper: getTMDBMovieMediaServiceMovieGenreApiToDomainMapper(),
            productionCompanyMapper: getTMDBMovieMediaServiceMovieProductionCompanyApiToDomainMapper(),
            productionCountryMapper: getTMDBMovieMediaServiceMovieProductionCountryApiToDomainMapper(),
            spokenLanguageMapper: getTMDBMovieMediaServiceMovieSpokenLanguageApiToDomainMapper()
        )
    }
    
    func getTMDBMovieMediaServiceMovieGenreApiToDomainMapper() -> Mappable {
        return TMDBMovieMediaServiceMovieGenreApiToDomainMapper()
    }
    
    func getTMDBMovieMediaServiceMovieProductionCompanyApiToDomainMapper() -> Mappable {
        return TMDBMovieMediaServiceMovieProductionCompanyApiToDomainMapper()
    }
    
    func getTMDBMovieMediaServiceMovieProductionCountryApiToDomainMapper() -> Mappable {
        return TMDBMovieMediaServiceMovieProductionCountryApiToDomainMapper()
    }
    
    func getTMDBMovieMediaServiceMovieSpokenLanguageApiToDomainMapper() -> Mappable {
        return TMDBMovieMediaServiceMovieSpokenLanguageApiToDomainMapper()
    }
}