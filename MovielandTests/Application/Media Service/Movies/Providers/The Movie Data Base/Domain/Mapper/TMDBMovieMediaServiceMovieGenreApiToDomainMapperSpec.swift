//
//  TMDBMovieMediaServiceMovieGenreApiToDomainMapperSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 17/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class TMDBMovieMediaServiceMovieGenreApiToDomainMapperSpec: QuickSpec {
    
    override func spec() {
        
        describe("TMDBMovieMediaServiceMovieGenreApiToDomainMapper") {
            
            let sut = Module().getTMDBMovieMediaServiceMovieGenreApiToDomainMapper()
            
            it("should map the movie genre api model into the domain model") {
                
                let apiModel = Module().getTMDBMovieServiceMovieGenreApiModel()
                let domainModel: MovieGenre = sut.mapObject(from: apiModel)
                
                expect(domainModel.id).to(equal(apiModel.id))
                expect(domainModel.name).to(equal(apiModel.name))
            }
        }
    }
}