//
//  TMDBRequestProcessorSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 16/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class TMDBRequestProcessorSpec: QuickSpec {
    
    override func spec() {
        
        describe("TMDBRequestProcessor") {
            
            let sut = TMDBRequestProcessor()
            
            context("when processing request") {
                
                it("should add TMDB api key to the request") {
                    
                    let url = NSURL(string: "https://littlebitesofcocoa.com/")!
                    let request = AlamofireHTTPRequestBuilder().build(with: .GET, url: url)
                    
                    let modifiedRequest = sut.processRequest(request)
                    
                    let expectedApiKey = modifiedRequest.parameters["api_key"]
                    
                    expect(expectedApiKey).notTo(beNil())
                }
            }
        }
    }
}