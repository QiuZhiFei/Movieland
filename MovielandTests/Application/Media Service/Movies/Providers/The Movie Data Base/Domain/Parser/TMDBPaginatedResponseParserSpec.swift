//
//  TMDBPaginatedResponseParserSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 21/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class TMDBPaginatedResponseParserSpec: QuickSpec {
    
    override func spec() {
        
        describe("TMDBPaginatedResponseParser") {
            
            let sut = Module().getTMDBPaginatedResponseApiParser()
            
            it("should parse a single item") {
             
                let json: [String: AnyObject] = JSONLoader.fixture("single_paginated_movies")
                
                let paginatedResponse: TMDBPaginatedResponseApiModel = sut.parse(json)
                
                expect(paginatedResponse.page).to(equal(1))
                expect(paginatedResponse.totalPages).to(equal(11324))
                expect(paginatedResponse.totalResults).to(equal(226478))
            }
        }
    }
}