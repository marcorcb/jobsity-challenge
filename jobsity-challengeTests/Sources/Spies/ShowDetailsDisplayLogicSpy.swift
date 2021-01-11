//
//  ShowDetailsDisplayLogicSpy.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation
@testable import jobsity_challenge

final class ShowDetailsDisplayLogicSpy: ShowDetailsDisplayLogic {

    // MARK: Properties Helpers

    private(set) var displayEpisodesByStateCalled = false
    private(set) var displayEpisodesByStateViewStatePassed: Shows.EpisodesData.ViewState?

    // MARK: - Presentation Logic

    func displayEpisodesByState(_ state: Shows.EpisodesData.ViewState) {
        displayEpisodesByStateCalled = true
        displayEpisodesByStateViewStatePassed = state
    }
}
