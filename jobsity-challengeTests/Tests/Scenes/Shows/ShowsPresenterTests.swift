//
//  ShowsPresenterTests.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import XCTest
@testable import jobsity_challenge

final class ShowsPresenterTests: XCTestCase {
    func test_presentShows_whenReceivesContent_shouldPassCorrectSubscriptionStateToViewController() {
        // Given
        let viewControllerSpy = ShowsDisplayLogicSpy()
        let sut = makeSUT(with: viewControllerSpy)
        let expectedViewData: Shows.ShowsData.ViewState = .content(.showsMock)

        // When
        sut.presentShows(.contentMock)

        // Then
        guard let passedViewState = viewControllerSpy.displayShowsByStateViewStatePassed else {
            XCTFail("Could not find displayShowsByStateViewStatePassed")
            return
        }
        XCTAssertTrue(viewControllerSpy.displayShowsByStateCalled)
        XCTAssertEqual(String(describing: passedViewState), String(describing: expectedViewData))
    }

    func test_presentShows_whenReceivesEmptyContent_shouldPassCorrectSubscriptionStateToViewController() {
        // Given
        let viewControllerSpy = ShowsDisplayLogicSpy()
        let sut = makeSUT(with: viewControllerSpy)
        let expectedViewData: Shows.ShowsData.ViewState = .empty

        // When
        sut.presentShows(.emptyContentMock)

        // Then
        guard let passedViewState = viewControllerSpy.displayShowsByStateViewStatePassed else {
            XCTFail("Could not find displayShowsByStateViewStatePassed")
            return
        }
        XCTAssertTrue(viewControllerSpy.displayShowsByStateCalled)
        XCTAssertEqual(String(describing: passedViewState), String(describing: expectedViewData))
    }

    func test_presentShows_whenReceivesLoading_shouldPassCorrectSubscriptionStateToViewController() {
        // Given
        let viewControllerSpy = ShowsDisplayLogicSpy()
        let sut = makeSUT(with: viewControllerSpy)
        let expectedViewData: Shows.ShowsData.ViewState = .loading

        // When
        sut.presentShows(.loadingMock)

        // Then
        guard let passedViewState = viewControllerSpy.displayShowsByStateViewStatePassed else {
            XCTFail("Could not find displayShowsByStateViewStatePassed")
            return
        }
        XCTAssertTrue(viewControllerSpy.displayShowsByStateCalled)
        XCTAssertEqual(String(describing: passedViewState), String(describing: expectedViewData))
    }

    func test_presentShows_whenReceivesEmpty_shouldPassCorrectSubscriptionStateToViewController() {
        // Given
        let viewControllerSpy = ShowsDisplayLogicSpy()
        let sut = makeSUT(with: viewControllerSpy)
        let expectedViewData: Shows.ShowsData.ViewState = .empty

        // When
        sut.presentShows(.emptyMock)

        // Then
        guard let passedViewState = viewControllerSpy.displayShowsByStateViewStatePassed else {
            XCTFail("Could not find displayShowsByStateViewStatePassed")
            return
        }
        XCTAssertTrue(viewControllerSpy.displayShowsByStateCalled)
        XCTAssertEqual(String(describing: passedViewState), String(describing: expectedViewData))
    }

    func test_presentShows_whenReceivesError_shouldPassCorrectSubscriptionStateToViewController() {
        // Given
        let viewControllerSpy = ShowsDisplayLogicSpy()
        let sut = makeSUT(with: viewControllerSpy)
        let expectedViewData: Shows.ShowsData.ViewState = .error

        // When
        sut.presentShows(.errorMock)

        // Then
        guard let passedViewState = viewControllerSpy.displayShowsByStateViewStatePassed else {
            XCTFail("Could not find displayShowsByStateViewStatePassed")
            return
        }
        XCTAssertTrue(viewControllerSpy.displayShowsByStateCalled)
        XCTAssertEqual(String(describing: passedViewState), String(describing: expectedViewData))
    }

    func test_presentSearchResults_whenReceivesContent_shouldPassCorrectSubscriptionStateToViewController() {
        // Given
        let viewControllerSpy = ShowsDisplayLogicSpy()
        let sut = makeSUT(with: viewControllerSpy)
        let expectedViewData: Shows.SearchData.ViewState = .content(.searchMock)

        // When
        sut.presentSearchResults(.contentMock)

        // Then
        guard let passedViewState = viewControllerSpy.displaySearchResultsByStateViewStatePassed else {
            XCTFail("Could not find displaySearchResultsByStateViewStatePassed")
            return
        }
        XCTAssertTrue(viewControllerSpy.displaySearchResultsByStateCalled)
        XCTAssertEqual(String(describing: passedViewState), String(describing: expectedViewData))
    }

    func test_presentSearchResults_whenReceivesEmptyContent_shouldPassCorrectSubscriptionStateToViewController() {
        // Given
        let viewControllerSpy = ShowsDisplayLogicSpy()
        let sut = makeSUT(with: viewControllerSpy)
        let expectedViewData: Shows.SearchData.ViewState = .empty

        // When
        sut.presentSearchResults(.emptyContentMock)

        // Then
        guard let passedViewState = viewControllerSpy.displaySearchResultsByStateViewStatePassed else {
            XCTFail("Could not find displaySearchResultsByStateViewStatePassed")
            return
        }
        XCTAssertTrue(viewControllerSpy.displaySearchResultsByStateCalled)
        XCTAssertEqual(String(describing: passedViewState), String(describing: expectedViewData))
    }

    func test_presentSearchResults_whenReceivesLoading_shouldPassCorrectSubscriptionStateToViewController() {
        // Given
        let viewControllerSpy = ShowsDisplayLogicSpy()
        let sut = makeSUT(with: viewControllerSpy)
        let expectedViewData: Shows.SearchData.ViewState = .loading

        // When
        sut.presentSearchResults(.loadingMock)

        // Then
        guard let passedViewState = viewControllerSpy.displaySearchResultsByStateViewStatePassed else {
            XCTFail("Could not find displaySearchResultsByStateViewStatePassed")
            return
        }
        XCTAssertTrue(viewControllerSpy.displaySearchResultsByStateCalled)
        XCTAssertEqual(String(describing: passedViewState), String(describing: expectedViewData))
    }

    func test_presentSearchResults_whenReceivesEmpty_shouldPassCorrectSubscriptionStateToViewController() {
        // Given
        let viewControllerSpy = ShowsDisplayLogicSpy()
        let sut = makeSUT(with: viewControllerSpy)
        let expectedViewData: Shows.SearchData.ViewState = .empty

        // When
        sut.presentSearchResults(.emptyMock)

        // Then
        guard let passedViewState = viewControllerSpy.displaySearchResultsByStateViewStatePassed else {
            XCTFail("Could not find displaySearchResultsByStateViewStatePassed")
            return
        }
        XCTAssertTrue(viewControllerSpy.displaySearchResultsByStateCalled)
        XCTAssertEqual(String(describing: passedViewState), String(describing: expectedViewData))
    }

    func test_presentSearchResults_whenReceivesError_shouldPassCorrectSubscriptionStateToViewController() {
        // Given
        let viewControllerSpy = ShowsDisplayLogicSpy()
        let sut = makeSUT(with: viewControllerSpy)
        let expectedViewData: Shows.SearchData.ViewState = .error

        // When
        sut.presentSearchResults(.errorMock)

        // Then
        guard let passedViewState = viewControllerSpy.displaySearchResultsByStateViewStatePassed else {
            XCTFail("Could not find displaySearchResultsByStateViewStatePassed")
            return
        }
        XCTAssertTrue(viewControllerSpy.displaySearchResultsByStateCalled)
        XCTAssertEqual(String(describing: passedViewState), String(describing: expectedViewData))
    }

    // MARK: - Test Helpers

    private func makeSUT(
        with viewController: ShowsDisplayLogic = ShowsDisplayLogicDummy()
    ) -> ShowsPresenter {
        let sut = ShowsPresenter()
        sut.viewController = viewController
        return sut
    }
}
