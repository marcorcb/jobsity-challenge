//
//  ShowsInteractorTests.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import XCTest
@testable import jobsity_challenge

final class ShowsInteractorTests: XCTestCase {
    func test_onViewDidLoad_shouldCallCorrectMethodInPresenter() {
        // Given
        let presenterSpy = ShowsPresenterSpy()
        let sut = makeSUT(presenter: presenterSpy, showsUseCase: ShowsUseCaseStub())
        let expectedResponse: Shows.ShowsData.Response = .contentMock

        // When
        sut.onViewDidLoad()

        // Then
        guard let receivedResponse = presenterSpy.presentShowsResponsePassed else {
            XCTFail("Could not find presentShowsResponsePassed.")
            return
        }
        XCTAssertTrue(presenterSpy.presentShowsCalled)
        XCTAssertEqual(String(describing: receivedResponse), String(describing: expectedResponse))
    }

    func test_onViewDidLoad_whenReceivesError_shouldCallCorrectMethodInPresenterWithCorrectParameters() {
        // Given
        let presenterSpy = ShowsPresenterSpy()
        let useCaseStub = ShowsUseCaseStub()
        useCaseStub.getShowsUseCaseToBeReturned = .failure(.service(.network))
        let sut = makeSUT(presenter: presenterSpy, showsUseCase: useCaseStub)
        let expectedResponse: Shows.ShowsData.Response = .errorMock

        // When
        sut.onViewDidLoad()

        // Then
        guard let receivedResponse = presenterSpy.presentShowsResponsePassed else {
            XCTFail("Could not find presentShowsResponsePassed.")
            return
        }
        XCTAssertTrue(presenterSpy.presentShowsCalled)
        XCTAssertEqual(String(describing: receivedResponse), String(describing: expectedResponse))
    }

    func test_onViewDidLoad_whenReceivesEmpty_shouldCallCorrectMethodInPresenterWithCorrectParameters() {
        // Given
        let presenterSpy = ShowsPresenterSpy()
        let useCaseStub = ShowsUseCaseStub()
        useCaseStub.getShowsUseCaseToBeReturned = .success(.emptyMock)
        let sut = makeSUT(presenter: presenterSpy, showsUseCase: useCaseStub)
        let expectedResponse: Shows.ShowsData.Response = .emptyContentMock

        // When
        sut.onViewDidLoad()

        // Then
        guard let receivedResponse = presenterSpy.presentShowsResponsePassed else {
            XCTFail("Could not find presentShowsResponsePassed.")
            return
        }
        XCTAssertTrue(presenterSpy.presentShowsCalled)
        XCTAssertEqual(String(describing: receivedResponse), String(describing: expectedResponse))
    }

    func test_search_whenReceivesContent_shouldCallCorrectMethodInPresenterWithCorrectParameters() {
        // Given
        let presenterSpy = ShowsPresenterSpy()
        let useCaseStub = ShowsUseCaseStub()
        useCaseStub.getSearchUseCaseToBeReturned = .success(.searchMock)
        let sut = makeSUT(presenter: presenterSpy, showsUseCase: useCaseStub)
        let expectedResponse: Shows.SearchData.Response = .contentMock

        // When
        sut.search(for: "")

        // Then
        guard let receivedResponse = presenterSpy.presentSearchResultsResponsePassed else {
            XCTFail("Could not find presentSearchResultsResponsePassed.")
            return
        }
        XCTAssertTrue(presenterSpy.presentSearchResultsCalled)
        XCTAssertEqual(String(describing: receivedResponse), String(describing: expectedResponse))
    }

    func test_search_whenReceivesError_shouldCallCorrectMethodInPresenterWithCorrectParameters() {
        // Given
        let presenterSpy = ShowsPresenterSpy()
        let useCaseStub = ShowsUseCaseStub()
        useCaseStub.getSearchUseCaseToBeReturned = .failure(.service(.network))
        let sut = makeSUT(presenter: presenterSpy, showsUseCase: useCaseStub)
        let expectedResponse: Shows.SearchData.Response = .errorMock

        // When
        sut.search(for: "")

        // Then
        guard let receivedResponse = presenterSpy.presentSearchResultsResponsePassed else {
            XCTFail("Could not find presentSearchResultsResponsePassed.")
            return
        }
        XCTAssertTrue(presenterSpy.presentSearchResultsCalled)
        XCTAssertEqual(String(describing: receivedResponse), String(describing: expectedResponse))
    }

    func test_search_whenReceivesEmpty_shouldCallCorrectMethodInPresenterWithCorrectParameters() {
        // Given
        let presenterSpy = ShowsPresenterSpy()
        let useCaseStub = ShowsUseCaseStub()
        useCaseStub.getSearchUseCaseToBeReturned = .success(.emptyMock)
        let sut = makeSUT(presenter: presenterSpy, showsUseCase: useCaseStub)
        let expectedResponse: Shows.SearchData.Response = .emptyContentMock

        // When
        sut.search(for: "")

        // Then
        guard let receivedResponse = presenterSpy.presentSearchResultsResponsePassed else {
            XCTFail("Could not find presentSearchResultsResponsePassed.")
            return
        }
        XCTAssertTrue(presenterSpy.presentSearchResultsCalled)
        XCTAssertEqual(String(describing: receivedResponse), String(describing: expectedResponse))
    }

    // MARK: - Test Helpers

    private func makeSUT(
        presenter: ShowsPresentationLogic = ShowsPresenterDummy(),
        showsUseCase: ShowsUseCaseProvider = ShowsUseCaseDummy()
    ) -> ShowsInteractor {
        ShowsInteractor(
            presenter: presenter,
            showsUseCase: showsUseCase
        )
    }
}
