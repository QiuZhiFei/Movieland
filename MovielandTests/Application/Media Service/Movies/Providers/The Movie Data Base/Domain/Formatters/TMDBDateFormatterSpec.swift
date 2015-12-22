//
//  TMDBDateFormatterSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 16/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble
import Foundation

@testable import Movieland

class TMDBDateFormatterSpec: QuickSpec {
    
    override func spec() {
        
        describe("TMDBDateFormatter") {
            
            context("when formatting a date") {
                
                let sut = TMDBDateFormatter(
                    dateFormatter: NSDateFormatter()
                )
                
                it("should return a valid date if input is correct") {
                    
                    let dateToFormat = "1992-11-20" // my 🎂 yey!!!
                    
                    let formattedDate: NSDate = sut.format(dateToFormat)!
                    
                    let components = componentsFromDate(formattedDate)
                    
                    expect(components.day).to(equal(20))
                    expect(components.month).to(equal(1))
                    expect(components.year).to(equal(1992))
                }
            }
        }
    }
}

/**
 Helper function to get componetns from a date
 */
private func componentsFromDate(date: NSDate) -> NSDateComponents {
    let calendar = NSCalendar.currentCalendar()
    let components = calendar.components([.Day, .Month, .Year], fromDate: date)
    return components
}