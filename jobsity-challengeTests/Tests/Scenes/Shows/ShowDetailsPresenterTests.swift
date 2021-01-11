//
//  ShowDetailsPresenterTests.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import XCTest
@testable import jobsity_challenge

final class ShowDetailsPresenterTests: XCTestCase {
    func test_presentEpisodes_whenReceivesContent_shouldPassCorrectSubscriptionStateToViewController() {
        // Given
        let viewControllerSpy = ShowDetailsDisplayLogicSpy()
        let sut = makeSUT(with: viewControllerSpy)
        let expectedViewData: Shows.EpisodesData.ViewState = .content(.episodesMock)

        // When
        sut.presentEpisodes(.contentMock)

        // Then
        guard let passedViewState = viewControllerSpy.displayEpisodesByStateViewStatePassed else {
            XCTFail("Could not find displayEpisodesByStateViewStatePassed")
            return
        }
        XCTAssertTrue(viewControllerSpy.displayEpisodesByStateCalled)
        XCTAssertEqual(String(describing: passedViewState), String(describing: expectedViewData))
    }

    func test_presentEpisodes_whenReceivesLoading_shouldPassCorrectSubscriptionStateToViewController() {
        // Given
        let viewControllerSpy = ShowDetailsDisplayLogicSpy()
        let sut = makeSUT(with: viewControllerSpy)
        let expectedViewData: Shows.EpisodesData.ViewState = .loading

        // When
        sut.presentEpisodes(.loadingMock)

        // Then
        guard let passedViewState = viewControllerSpy.displayEpisodesByStateViewStatePassed else {
            XCTFail("Could not find displayEpisodesByStateViewStatePassed")
            return
        }
        XCTAssertTrue(viewControllerSpy.displayEpisodesByStateCalled)
        XCTAssertEqual(String(describing: passedViewState), String(describing: expectedViewData))
    }

    func test_presentEpisodes_whenReceivesError_shouldPassCorrectSubscriptionStateToViewController() {
        // Given
        let viewControllerSpy = ShowDetailsDisplayLogicSpy()
        let sut = makeSUT(with: viewControllerSpy)
        let expectedViewData: Shows.EpisodesData.ViewState = .error

        // When
        sut.presentEpisodes(.errorMock)

        // Then
        guard let passedViewState = viewControllerSpy.displayEpisodesByStateViewStatePassed else {
            XCTFail("Could not find displayEpisodesByStateViewStatePassed")
            return
        }
        XCTAssertTrue(viewControllerSpy.displayEpisodesByStateCalled)
        XCTAssertEqual(String(describing: passedViewState), String(describing: expectedViewData))
    }

    // MARK: - Test Helpers

    private func makeSUT(
        with viewController: ShowDetailsDisplayLogic = ShowDetailsDisplayLogicDummy()
    ) -> ShowDetailsPresenter {
        let sut = ShowDetailsPresenter()
        sut.viewController = viewController
        return sut
    }
}
