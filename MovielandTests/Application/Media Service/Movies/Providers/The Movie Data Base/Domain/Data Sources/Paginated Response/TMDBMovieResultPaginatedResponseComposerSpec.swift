//
//  TMDBMovieResultPaginatedResponseComposerSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 21/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class TMDBMovieResultPaginatedResponseComposerSpec: QuickSpec {
    
    override func spec() {
        
        describe("TMDBMovieResultPaginatedResponseComposer") {
            
            let parser = TMDBPaginatedResponseApiParserMock()
            
            let sut = TMDBMovieResultPaginatedResponseComposer(
                parser: parser,
                mapperProvider: Module()
            )
            
            context("when composing the paginated response") {
                
                let json: [String: AnyObject] = JSONLoader.fixture("single_paginated_movies")
                
                let httpResponse = HTTPResponseMock(
                    urlRequest: nil,
                    httpUrlResponse: nil,
                    data: nil,
                    error: nil,
                    json: json
                )
                
                sut.paginate(httpResponse, items: [])

                it("should parse the response") {
                    expect(parser.parseExecuted).to(beTruthy())
                }
            }
        }
    }
}

// MARK: - Mocks

class TMDBPaginatedResponseApiParserMock: Parseable {
    
    var parseExecuted = false
    
    func parse<T where T : Model>(element: [String : AnyObject]) -> T {
        parseExecuted = true
        
        return Module().getTMDBPaginatedResponseApiModel() as! T
    }
}

struct HTTPResponseMock: HTTPResponse {
    
    var urlRequest: NSURLRequest?
    var httpUrlResponse: NSHTTPURLResponse?
    var data: NSData?
    var error: NSError?
    var json: [String: AnyObject]
}