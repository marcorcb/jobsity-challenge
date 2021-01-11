//
//  ShowDetailsPresenterSpy.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation
@testable import jobsity_challenge

final class ShowDetailsPresenterSpy: ShowDetailsPresentationLogic {

    // MARK: Properties Helpers

    private(set) var presentEpisodesCalled = false
    private(set) var presentEpisodesResponsePassed: Shows.EpisodesData.Response?

    // MARK: - Presentation Logic

    func presentEpisodes(_ response: Shows.EpisodesData.Response) {
        presentEpisodesCalled = true
        presentEpisodesResponsePassed = response
    }
}
