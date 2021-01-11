//
//  ShowsUseCaseStub.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation
@testable import jobsity_challenge

final class ShowsUseCaseStub: ShowsUseCaseProvider {
    var getShowsUseCaseToBeReturned: Result<ShowsUseCaseModel,
                                            ShowsUseCaseError> = .success(.showsMock)
    var getSearchUseCaseToBeReturned: Result<SearchUseCaseModel,
                                             ShowsUseCaseError> = .success(.searchMock)

    func execute(page: Int, then handle: @escaping (Result<ShowsUseCaseModel, ShowsUseCaseError>) -> Void) {
        handle(getShowsUseCaseToBeReturned)
    }

    func execute(showName: String, then handle: @escaping (Result<SearchUseCaseModel, ShowsUseCaseError>) -> Void) {
        handle(getSearchUseCaseToBeReturned)
    }
}
