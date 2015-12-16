//
//  TMDBMovieMediaServiceSpokenLanguageApiParserSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 16/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class TMDBMovieMediaServiceSpokenLanguageApiParserSpec: QuickSpec {
    
    override func spec() {
        
        describe("TMDBMovieMediaServiceSpokenLanguageApiParser") {
            
            let sut = Module().getTMDBMovieMediaServiceSpokenLanguageApiParser()
            
            it("should parse a single item") {
                
                let json: [String: AnyObject] = JSONLoader.fixture("single_spoken_language")
                
                let spokenLanguage: TMDBMovieSpokenLanguageApiModel = sut.parse(json)
                
                expect(spokenLanguage.iso_639_1).to(equal("en"))
                expect(spokenLanguage.name).to(equal("English"))
            }
        }
    }
}