//
//  TMDBMovieMediaServiceSearchApiParserSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 16/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class TMDBMovieMediaServiceSearchApiParserSpec: QuickSpec {
    
    override func spec() {
        
        describe("TMDBMovieMediaServiceSearchApiParser") {
            
            let sut = Module().getTMDBMovieMediaServiceSearchApiParser()
            
            it("should parse a single item") {
                
                let json: [String: AnyObject] = JSONLoader.fixture("single_movie_search_result")
                
                let movieSearchResult: TMDBMovieSearchResultApiModel = sut.parse(json)
                
                expect(movieSearchResult.id).to(equal("550"))
                expect(movieSearchResult.title).to(equal("Fight Club"))
                expect(movieSearchResult.originalTitle).to(equal("Fight Club"))
                expect(movieSearchResult.overview).to(equal("A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion."))
                expect(movieSearchResult.popularity).to(equal(4.39844))
                expect(movieSearchResult.posterPath).to(equal("/811DjJTon9gD6hZ8nCjSitaIXFQ.jpg"))
                expect(movieSearchResult.backdropPath).to(equal("/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg"))
                expect(movieSearchResult.releaseDate).to(equal("1999-10-14"))
                expect(movieSearchResult.voteAverage).to(equal(7.8))
                expect(movieSearchResult.voteCount).to(equal(3527))
                expect(movieSearchResult.genreIds).to(contain(18))
                expect(movieSearchResult.originalLanguage).to(equal("en"))
                expect(movieSearchResult.video).to(beFalsy())
            }
        }
    }
}