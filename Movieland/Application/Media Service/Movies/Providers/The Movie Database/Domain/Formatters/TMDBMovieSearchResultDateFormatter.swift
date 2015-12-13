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
    
    func format<I, O>(input: I) -> O? {
        
        let dateString = input as! String
 
        dateFormatter.dateFormat = "yyyy-mm-dd"
        
        return dateFormatter.dateFromString(dateString) as? O
    }
}