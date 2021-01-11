//
//  SearchUseCaseModelExtensions.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation
@testable import jobsity_challenge

extension SearchUseCaseModel {
    static var searchMock: SearchUseCaseModel {
        .init(data: [.searchResultMock])
    }

    static var emptyMock: SearchUseCaseModel {
        .init(data: [])
    }
}

extension SearchUseCaseModel.SearchResult {
    static var searchResultMock: SearchUseCaseModel.SearchResult {
        .init(
            score: 17.376015,
            show: .showMock
        )
    }
}
