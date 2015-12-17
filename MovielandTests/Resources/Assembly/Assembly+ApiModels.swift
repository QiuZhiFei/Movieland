//
//  Assembly+ApiModels.swift
//  Movieland
//
//  Created by Oscar Duran on 16/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

@testable import Movieland

extension Assembly {
    
    func getTMDBMovieSearchResultApiModel() -> TMDBMovieSearchResultApiModel {
        
        let parser = getTMDBMovieMediaServiceSearchApiParser()
        let json: [String: AnyObject] = JSONLoader.fixture("single_movie_search_result")
        let movieSearchResult: TMDBMovieSearchResultApiModel = parser.parse(json)
        
        return movieSearchResult
    }
    
    func getTMDBMovieServiceMovieGenreApiModel() -> TMDBMovieGenreApiModel {
        
        let parser = getTMDBMovieMediaServiceGenreApiParser()
        let json: [String: AnyObject] = JSONLoader.fixture("single_genre")
        let movieGenre: TMDBMovieGenreApiModel = parser.parse(json)
        
        return movieGenre
    }
    
    func getTMDBMovieProductionCompanyApiModel() -> TMDBMovieProductionCompanyApiModel {
        
        let parser = getTMDBMovieMediaServiceProductionCompanyApiParser()
        let json: [String: AnyObject] = JSONLoader.fixture("single_production_company")
        let productionCompany: TMDBMovieProductionCompanyApiModel = parser.parse(json)
        
        return productionCompany
    }
}