//
//  ShowDetailsInteractorTests.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import XCTest
@testable import jobsity_challenge

final class ShowDetailsInteractorTests: XCTestCase {
    func test_onViewDidLoad_shouldCallCorrectMethodInPresenter() {
        // Given
        let presenterSpy = ShowDetailsPresenterSpy()
        let sut = makeSUT(presenter: presenterSpy, episodesUseCase: EpisodesUseCaseStub())
        let expectedResponse: Shows.EpisodesData.Response = .contentMock

        // When
        sut.onViewDidLoad(for: 0)

        // Then
        guard let receivedResponse = presenterSpy.presentEpisodesResponsePassed else {
            XCTFail("Could not find presentEpisodesResponsePassed.")
            return
        }
        XCTAssertTrue(presenterSpy.presentEpisodesCalled)
        XCTAssertEqual(String(describing: receivedResponse), String(describing: expectedResponse))
    }

    func test_onViewDidLoad_whenReceivesError_shouldCallCorrectMethodInPresenterWithCorrectParameters() {
        // Given
        let presenterSpy = ShowDetailsPresenterSpy()
        let useCaseStub = EpisodesUseCaseStub()
        useCaseStub.getEpisodesUseCaseToBeReturned = .failure(.service(.network))
        let sut = makeSUT(presenter: presenterSpy, episodesUseCase: useCaseStub)
        let expectedResponse: Shows.EpisodesData.Response = .errorMock

        // When
        sut.onViewDidLoad(for: 0)

        // Then
        guard let receivedResponse = presenterSpy.presentEpisodesResponsePassed else {
            XCTFail("Could not find presentEpisodesResponsePassed.")
            return
        }
        XCTAssertTrue(presenterSpy.presentEpisodesCalled)
        XCTAssertEqual(String(describing: receivedResponse), String(describing: expectedResponse))
    }

    // MARK: - Test Helpers

    private func makeSUT(
        presenter: ShowDetailsPresentationLogic = ShowDetailsPresenterDummy(),
        episodesUseCase: EpisodesUseCaseProvider = EpisodesUseCaseDummy()
    ) -> ShowDetailsInteractor {
        ShowDetailsInteractor(
            presenter: presenter,
            episodesUseCase: episodesUseCase
        )
    }
}
