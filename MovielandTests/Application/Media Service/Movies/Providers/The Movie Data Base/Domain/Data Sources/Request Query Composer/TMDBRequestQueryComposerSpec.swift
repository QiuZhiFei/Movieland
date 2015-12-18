//
//  TMDBRequestQueryComposerSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 18/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class TMDBRequestQueryComposerSpec: QuickSpec {
    
    override func spec() {
        
        let sut = Module().getTMDBRequestQueryComposer()
        
        describe("TMDBRequestQueryComposer") {
            
            context("when given some query parameters") {
                
                it("should add the parameters to the request") {
                    
                    let url = NSURL(string: "http://nshipster.com/")! // No introduction needed
                    
                    let request = AlamofireHTTPRequestBuilder().build(
                        with: .GET,
                        url: url)
                    
                    let page = 5
                    let pagination = DefaultPaginableRequest(page: page)
                    let parameters = QueryParameters(
                        pagination: pagination
                    )
                    
                    let composedRequest = sut.compose(request, parameters: parameters)
                    
                    let pageParameter = composedRequest.parameters["page"] as! Int
                    
                    expect(pageParameter).to(equal(page))
                }
            }
            
            context("when there are no parameters") {
                
                it("should return the same request") {
                    
                    let url = NSURL(string: "https://vimeo.com/85490944")! // Cremita de la buena 🍨
                    
                    let request = AlamofireHTTPRequestBuilder().build(
                        with: .GET,
                        url: url)
                    
                    let newRequest = sut.compose(request, parameters: nil)
                    
                    expect(request.identifier).to(equal(newRequest.identifier))
                }
            }
        }
    }
}