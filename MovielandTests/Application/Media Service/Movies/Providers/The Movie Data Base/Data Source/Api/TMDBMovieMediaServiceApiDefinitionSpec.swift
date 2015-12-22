//
//  TMDBMovieMediaServiceApiDefinitionSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 22/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class TMDBMovieMediaServiceApiDefinitionSpec: QuickSpec {
    
    override func spec() {
        
        describe("TMDBMovieMediaServiceApiDefinition") {
            
            context("when generating the url api definition") {
                
                it("should use the correct api base url") {
                    
                    let apiBaseUrl = TMDBMovieMediaServiceApiDefinition.ApiBaseUrl.path
                    
                    expect(apiBaseUrl).to(equal("https://api.themoviedb.org/3/"))
                }
                
                it("should use the correct search path") {
                    
                    let searchPath = TMDBMovieMediaServiceApiDefinition.Search.path
                    
                    expect(searchPath).to(equal("search/movie"))
                }
                
                it("should use the correct movie by id path") {
                    
                    let movieByIdPath = TMDBMovieMediaServiceApiDefinition.GetMovieById(movieId: "5678965y8y7898090").path
                    
                    let expectedMovieByIdPath = "movie/5678965y8y7898090"
                    
                    expect(movieByIdPath).to(equal(expectedMovieByIdPath))
                }
                
                it("should use the correct movies by mode path") {
                    
                    let moviesByMode = TMDBMovieMediaServiceApiDefinition.GetMoviesByMode(mode: "popular").path
                    
                    let expectedMoviesByModePath = "movie/popular"
                    
                    expect(moviesByMode).to(equal(expectedMoviesByModePath))
                }
            }
        }
    }
}
