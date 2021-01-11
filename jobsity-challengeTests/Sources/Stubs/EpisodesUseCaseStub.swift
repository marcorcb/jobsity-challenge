//
//  EpisodesUseCaseStub.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation
@testable import jobsity_challenge

final class EpisodesUseCaseStub: EpisodesUseCaseProvider {
    var getEpisodesUseCaseToBeReturned: Result<EpisodesUseCaseModel,
                                               ShowsUseCaseError> = .success(.episodesMock)

    func execute(showID: Int, then handle: @escaping (Result<EpisodesUseCaseModel, ShowsUseCaseError>) -> Void) {
        handle(getEpisodesUseCaseToBeReturned)
    }
}
