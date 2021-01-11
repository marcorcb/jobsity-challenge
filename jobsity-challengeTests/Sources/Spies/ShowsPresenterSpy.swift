//
//  ShowsPresenterSpy.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation
@testable import jobsity_challenge

final class ShowsPresenterSpy: ShowsPresentationLogic {

    // MARK: Properties Helpers

    private(set) var presentShowsCalled = false
    private(set) var presentShowsResponsePassed: Shows.ShowsData.Response?

    private(set) var presentSearchResultsCalled = false
    private(set) var presentSearchResultsResponsePassed: Shows.SearchData.Response?

    // MARK: - Presentation Logic

    func presentShows(_ response: Shows.ShowsData.Response) {
        presentShowsCalled = true
        presentShowsResponsePassed = response
    }

    func presentSearchResults(_ response: Shows.SearchData.Response) {
        presentSearchResultsCalled = true
        presentSearchResultsResponsePassed = response
    }
}
