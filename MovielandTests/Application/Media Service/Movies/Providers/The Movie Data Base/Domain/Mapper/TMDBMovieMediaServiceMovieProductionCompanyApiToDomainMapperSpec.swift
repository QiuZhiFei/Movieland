//
//  TMDBMovieMediaServiceMovieProductionCompanyApiToDomainMapperSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 17/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class TMDBMovieMediaServiceMovieProductionCompanyApiToDomainMapperSpec: QuickSpec {
    
    override func spec() {
        
        describe("TMDBMovieMediaServiceMovieProductionCompanyApiToDomainMapper") {
            
            let sut = Module().getTMDBMovieMediaServiceMovieProductionCompanyApiToDomainMapper()
            
            it("should map the production company api model into the domain model") {
                
                let apiModel = Module().getTMDBMovieProductionCompanyApiModel()
                let domainModel: MovieProductionCompany = sut.mapObject(from: apiModel)
                
                expect(domainModel.id).to(equal(apiModel.id))
                expect(domainModel.name).to(equal(apiModel.name))
            }
        }
    }
}