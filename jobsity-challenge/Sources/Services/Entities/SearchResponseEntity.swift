//
//  SearchResponseEntity.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation

enum SearchResponseEntity {
    struct Data: Codable {
        let score: Double
        let show: ShowsResponseEntity.Data
    }
}
