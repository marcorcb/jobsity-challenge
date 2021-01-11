//
//  EpisodesUseCaseDummy.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation
@testable import jobsity_challenge

final class EpisodesUseCaseDummy: EpisodesUseCaseProvider {
    func execute(showID: Int,
                 then handle: @escaping (Result<EpisodesUseCaseModel, ShowsUseCaseError>) -> Void) {}
}
