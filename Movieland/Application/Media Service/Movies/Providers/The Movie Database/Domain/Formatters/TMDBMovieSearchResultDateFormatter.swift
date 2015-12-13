//
//  TMDBMovieSearchResultDateFormatter.swift
//  Movieland
//
//  Created by Oscar Duran on 13/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct TMDBMovieSearchResultDateFormatter: Formateable {
    
    let dateFormatter: NSDateFormatter
    
    init(dateFormatter: NSDateFormatter) {
        self.dateFormatter = dateFormatter
    }
    
    func format<I, O>(input: I) -> O {
        
        let date = input as! String
 
        dateFormatter.dateFormat = "YYYY-mm-HH"
        
        return dateFormatter.dateFromString(date) as! O
    }
}