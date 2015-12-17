//
//  TMDBMovieMediaServiceSearchApiToDomainMapperSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 16/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class TMDBMovieMediaServiceSearchApiToDomainMapperSpec: QuickSpec {
    
    override func spec() {
        
        describe("TMDBMovieMediaServiceSearchApiToDomainMapper") {
            
            let sut = Module().getTMDBMovieMediaServiceSearchApiToDomainMapper()
            
            it("should map the search result api model into the domain model") {
                
                let apiModel = Module().getTMDBMovieSearchResultApiModel()
                let domainModel: MovieSearchResult = sut.mapObject(from: apiModel)
                
                expect(domainModel.id).to(equal(apiModel.id))
                expect(domainModel.title).to(equal(apiModel.title))
                expect(domainModel.originalTitle).to(equal(apiModel.originalTitle))
                expect(domainModel.overview).to(equal(apiModel.overview))
                expect(domainModel.popularity).to(equal(apiModel.popularity))
                expect(domainModel.posterPath).to(equal(apiModel.posterPath))
                expect(domainModel.backdropPath).to(equal(apiModel.backdropPath))
                expect(domainModel.voteAverage).to(equal(apiModel.voteAverage))
                expect(domainModel.voteCount).to(equal(apiModel.voteCount))
                expect(domainModel.genreIds).to(equal(apiModel.genreIds))
                expect(domainModel.originalLanguage).to(equal(apiModel.originalLanguage))
                expect(domainModel.hasVideo).to(equal(apiModel.video))
            }
        }
    }
}