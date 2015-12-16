//
//  TMDBMovieMediaServiceGenreApiParserSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 16/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class TMDBMovieMediaServiceGenreApiParserSpec: QuickSpec {
    
    override func spec() {
        
        describe("TMDBMovieMediaServiceGenreApiParser") {
            
            let sut = TMDBMovieMediaServiceGenreApiParser()
            
            it("should parse a single item") {
                
                let json: [String: AnyObject] = JSONLoader.fixture("single_genre")
                
                let movieGenre: TMDBMovieGenreApiModel = sut.parse(json)
                
                expect(movieGenre.id).to(equal("18"))
                expect(movieGenre.name).to(equal("Drama"))
            }
        }
    }
}