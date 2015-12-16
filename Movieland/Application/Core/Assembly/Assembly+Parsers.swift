//
//  Assembly+Parsers.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

extension Assembly {
    
    func getTMDBMovieMediaServiceSearchApiParser() -> Parseable {
        return TMDBMovieMediaServiceSearchApiParser()
    }
    
    func getTMDBMovieMediaServiceMovieApiParser() -> Parseable {
        return TMDBMovieMediaServiceMovieApiParser(
            genreParser: getTMDBMovieMediaServiceGenreApiParser(),
            productionCompanyParser: getTMDBMovieMediaServiceProductionCompanyApiParser(),
            productionCountryParser: getTMDBMovieMediaServiceProductionCountryApiParser(),
            spokenLanguageParser: getTMDBMovieMediaServiceSpokenLanguageApiParser()
        )
    }
    
    func getTMDBMovieMediaServiceGenreApiParser() -> Parseable {
        return TMDBMovieMediaServiceGenreApiParser()
    }
    
    func getTMDBMovieMediaServiceProductionCompanyApiParser() -> Parseable {
        return TMDBMovieMediaServiceProductionCompanyApiParser()
    }
    
    func getTMDBMovieMediaServiceProductionCountryApiParser() -> Parseable {
        return TMDBMovieMediaServiceProductionCountryApiParser()
    }
    
    func getTMDBMovieMediaServiceSpokenLanguageApiParser() -> Parseable {
        return TMDBMovieMediaServiceSpokenLanguageApiParser()
    }
}