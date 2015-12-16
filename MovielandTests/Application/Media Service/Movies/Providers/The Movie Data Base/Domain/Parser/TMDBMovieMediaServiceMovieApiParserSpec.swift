//
//  TMDBMovieMediaServiceMovieApiParserSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 16/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class TMDBMovieMediaServiceMovieApiParserSpec: QuickSpec {
    
    override func spec() {
        
        describe("TMDBMovieMediaServiceMovieApiParser") {
            
            let genreParser = Assembly.defaultAssembly.getTMDBMovieMediaServiceGenreApiParser()
            let productionCompanyParser = Assembly.defaultAssembly.getTMDBMovieMediaServiceProductionCompanyApiParser()
            let productionCountryParser = Assembly.defaultAssembly.getTMDBMovieMediaServiceProductionCountryApiParser()
            let spokenLanguageParser = Assembly.defaultAssembly.getTMDBMovieMediaServiceSpokenLanguageParser()
            
            let sut = TMDBMovieMediaServiceMovieApiParser(
                genreParser: genreParser,
                productionCompanyParser: productionCompanyParser,
                productionCountryParser: productionCountryParser,
                spokenLanguageParser: spokenLanguageParser
            )
            
            it("should parse a single item") {
                
                let json: [String: AnyObject] = JSONLoader.fixture("single_movie")
                
                let movie: TMDBMovieApiModel = sut.parse(json)
                
                expect(movie.id).to(equal("550"))
                expect(movie.title).to(equal("Fight Club"))
                expect(movie.originalTitle).to(equal("Fight Club"))
                expect(movie.overview).to(equal("A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion."))
                expect(movie.popularity).to(equal(2.50307202280779))
                expect(movie.posterPath).to(equal("/2lECpi35Hnbpa4y46JX0aY3AWTy.jpg"))
                expect(movie.backdropPath).to(equal("/hNFMawyNDWZKKHU4GYCBz1krsRM.jpg"))
                expect(movie.releaseDate).to(equal("1999-10-14"))
                expect(movie.voteAverage).to(equal(7.7))
                expect(movie.voteCount).to(equal(3185))
                expect(movie.genres).to(haveCount(1))
                expect(movie.originalLanguage).to(equal("en"))
                expect(movie.video).to(beFalsy())
                expect(movie.adult).to(beFalsy())
                expect(movie.budget).to(equal(63_000_000))
                expect(movie.revenue).to(equal(100_853_753))
                expect(movie.homepage).to(equal(""))
                expect(movie.imdbId).to(equal("tt0137523"))
                expect(movie.status).to(equal("Released"))
                expect(movie.tagline).to(equal("How much can you know about yourself if you've never been in a fight?"))
                expect(movie.productionCompanies).to(haveCount(3))
                expect(movie.productionCountries).to(haveCount(2))
                expect(movie.spokenLanguages).to(haveCount(1))
            }
        }
    }
}
