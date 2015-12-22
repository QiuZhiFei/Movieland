//
//  TMDBMovieMediaServiceMovieSpokenLanguageApiToDomainMapperSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 17/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class TMDBMovieMediaServiceMovieSpokenLanguageApiToDomainMapperSpec: QuickSpec {
    
    override func spec() {
        
        describe("TMDBMovieMediaServiceMovieSpokenLanguageApiToDomainMapper") {
            
            let sut = Module().getTMDBMovieMediaServiceMovieSpokenLanguageApiToDomainMapper()
            
            it("should map the spoken language api model into the domain model") {
                
                let apiModel = Module().getTMDBMovieSpokenLanguageApiModel()
                let domainModel: MovieSpokenLanguage = sut.mapObject(from: apiModel)
                
                expect(domainModel.iso_639_1).to(equal(apiModel.iso_639_1))
                expect(domainModel.name).to(equal(apiModel.name))
            }
        }
    }
}