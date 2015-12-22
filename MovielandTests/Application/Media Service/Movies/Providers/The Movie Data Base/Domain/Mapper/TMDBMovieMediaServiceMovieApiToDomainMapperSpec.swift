//
//  TMDBMovieMediaServiceMovieApiToDomainMapperSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 17/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class TMDBMovieMediaServiceMovieApiToDomainMapperSpec: QuickSpec {
    
    override func spec() {
        
        describe("TMDBMovieMediaServiceMovieApiToDomainMapper") {
            
            let sut = Module().getTMDBMovieMediaServiceMovieApiToDomainMapper()
            
            it("should map the movie api model into the domain model") {
                
                let apiModel = Module().getTMDBMovieApiModel()
                let domainModel: Movie = sut.mapObject(from: apiModel)
                
                expect(domainModel.id).to(equal(apiModel.id))
                expect(domainModel.title).to(equal(apiModel.title))
                expect(domainModel.originalTitle).to(equal(apiModel.originalTitle))
                expect(domainModel.overview).to(equal(apiModel.overview))
                expect(domainModel.popularity).to(equal(apiModel.popularity))
                expect(domainModel.posterPath).to(equal(apiModel.posterPath))
                expect(domainModel.backdropPath).to(equal(apiModel.backdropPath))
                expect(domainModel.voteAverage).to(equal(apiModel.voteAverage))
                expect(domainModel.voteCount).to(equal(apiModel.voteCount))
                expect(domainModel.genres.count).to(equal(apiModel.genres.count))
                expect(domainModel.originalLanguage).to(equal(apiModel.originalLanguage))
                expect(domainModel.hasVideo).to(equal(apiModel.video))
                expect(domainModel.isAdultVideo).to(equal(apiModel.adult))
                expect(domainModel.budget).to(equal(apiModel.budget))
                expect(domainModel.revenue).to(equal(apiModel.revenue))
                expect(domainModel.homepage).to(equal(apiModel.homepage))
                expect(domainModel.imdbId).to(equal(apiModel.imdbId))
                expect(domainModel.status).to(equal(apiModel.status))
                expect(domainModel.tagline).to(equal(apiModel.tagline))
                expect(domainModel.productionCompanies.count).to(equal(apiModel.productionCompanies.count))
                expect(domainModel.productionCountries.count).to(equal(apiModel.productionCountries.count))
                expect(domainModel.spokenLanguages.count).to(equal(apiModel.spokenLanguages.count))
            }
        }
    }
}