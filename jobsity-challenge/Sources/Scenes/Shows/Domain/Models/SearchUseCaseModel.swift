//
//  SearchUseCaseModel.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation

struct SearchUseCaseModel {
    let data: [SearchResult]

    struct SearchResult {
        let score: Double
        let show: ShowsUseCaseModel.Show
    }
}
