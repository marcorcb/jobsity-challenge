//
//  SearchResponseEntityExtensions.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation
@testable import jobsity_challenge

extension SearchResponseEntity.Data {
    static var searchMock: SearchResponseEntity.Data {
        .init(
            score: 17.376015,
            show: .showsMock
        )
    }
}
