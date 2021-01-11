//
//  ShowsDisplayLogicSpy.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation
@testable import jobsity_challenge

final class ShowsDisplayLogicSpy: ShowsDisplayLogic {

    // MARK: Properties Helpers

    private(set) var displayShowsByStateCalled = false
    private(set) var displayShowsByStateViewStatePassed: Shows.ShowsData.ViewState?

    private(set) var displaySearchResultsByStateCalled = false
    private(set) var displaySearchResultsByStateViewStatePassed: Shows.SearchData.ViewState?

    // MARK: - Presentation Logic

    func displayShowsByState(_ state: Shows.ShowsData.ViewState) {
        displayShowsByStateCalled = true
        displayShowsByStateViewStatePassed = state
    }

    func displaySearchResultsByState(_ state: Shows.SearchData.ViewState) {
        displaySearchResultsByStateCalled = true
        displaySearchResultsByStateViewStatePassed = state
    }
}
