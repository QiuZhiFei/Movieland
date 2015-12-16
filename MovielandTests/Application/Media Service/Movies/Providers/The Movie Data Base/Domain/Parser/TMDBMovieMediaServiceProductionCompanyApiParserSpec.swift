//
//  TMDBMovieMediaServiceProductionCompanyApiParserSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 16/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class TMDBMovieMediaServiceProductionCompanyApiParserSpec: QuickSpec {
    
    override func spec() {
        
        describe("TMDBMovieMediaServiceProductionCompanyApiParser") {
            
            let sut = TMDBMovieMediaServiceProductionCompanyApiParser()
            
            it("should parse a single item") {
                
                let json: [String: AnyObject] = JSONLoader.fixture("single_production_company")
                
                let productionCompany: TMDBMovieProductionCompanyApiModel = sut.parse(json)
                
                expect(productionCompany.id).to(equal("711"))
                expect(productionCompany.name).to(equal("Fox 2000 Pictures"))
            }
        }
    }
}