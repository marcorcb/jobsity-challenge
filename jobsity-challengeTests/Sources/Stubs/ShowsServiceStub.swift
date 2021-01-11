//
//  ShowsServiceStub.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation
@testable import jobsity_challenge

final class ShowsServiceStub: ShowsServiceProvider {
    var getShowsResponseDataToBeReturned: Result<[ShowsResponseEntity.Data],
                                                 ShowsServiceError> = .success([.showsMock])
    var getEpisodesResponseDataToBeReturned: Result<[EpisodesResponseEntity.Data],
                                                    ShowsServiceError> = .success([.episodeMock])
    var getSearchResponseDataToBeReturned: Result<[SearchResponseEntity.Data],
                                                  ShowsServiceError> = .success([.searchMock])

    func shows(page: Int,
               then handle: @escaping (Result<[ShowsResponseEntity.Data], ShowsServiceError>) -> Void) {
        handle(getShowsResponseDataToBeReturned)
    }

    func episodes(showID: Int,
                  then handle: @escaping (Result<[EpisodesResponseEntity.Data], ShowsServiceError>) -> Void) {
        handle(getEpisodesResponseDataToBeReturned)
    }

    func search(showName: String,
                then handle: @escaping (Result<[SearchResponseEntity.Data], ShowsServiceError>) -> Void) {
        handle(getSearchResponseDataToBeReturned)
    }
}
