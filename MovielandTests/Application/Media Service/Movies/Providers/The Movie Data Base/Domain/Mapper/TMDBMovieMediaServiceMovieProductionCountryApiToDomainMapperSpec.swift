//
//  TMDBMovieMediaServiceMovieProductionCountryApiToDomainMapperSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 17/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class TMDBMovieMediaServiceMovieProductionCountryApiToDomainMapperSpec: QuickSpec {
    
    override func spec() {
        
        describe("TMDBMovieMediaServiceMovieProductionCountryApiToDomainMapper") {
            
            let sut = Module().getTMDBMovieMediaServiceMovieProductionCountryApiToDomainMapper()
            
            it("should map the production country api model into the domain model") {
             
                let apiModel = Module().getTMDBMovieProductionCountryApiModel()
                let domainModel: MovieProductionCountry = sut.mapObject(from: apiModel)
                
                expect(domainModel.iso_3166_1).to(equal(apiModel.iso_3166_1))
                expect(domainModel.name).to(equal(apiModel.name))
            }
        }
    }
}