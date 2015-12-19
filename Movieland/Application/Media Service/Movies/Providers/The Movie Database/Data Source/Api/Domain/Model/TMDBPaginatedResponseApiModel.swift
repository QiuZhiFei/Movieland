//
//  TMDBPaginatedResponseApiModel.swift
//  Movieland
//
//  Created by Oscar Duran on 19/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct TMDBPaginatedResponseApiModel: Model {
    
    let page: Int
    let totalPages: Int
    let totalResults: Int
}