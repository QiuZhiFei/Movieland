//
//  TMDBMovieMediaServiceProductionCountryApiParserSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 16/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class TMDBMovieMediaServiceProductionCountryApiParserSpec: QuickSpec {
    
    override func spec() {
        
        describe("TMDBMovieMediaServiceProductionCountryApiParser") {
            
            let sut = TMDBMovieMediaServiceProductionCountryApiParser()
            
            it("should parse a single item") {
                
                let json: [String: AnyObject] = JSONLoader.fixture("single_production_country")
                
                let productionCountry: TMDBMovieProductionCountryApiModel = sut.parse(json)
                
                expect(productionCountry.iso_3166_1).to(equal("US"))
                expect(productionCountry.name).to(equal("United States of America"))
            }
        }
    }
}