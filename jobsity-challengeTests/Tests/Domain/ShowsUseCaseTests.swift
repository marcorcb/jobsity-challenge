//
//  ShowsUseCaseTests.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import XCTest
@testable import jobsity_challenge

final class ShowsUseCaseTests: XCTestCase {
    func test_execute_shows_whenNetworkError_shouldReturnNetworkErrorResponse() {
        let serviceStub = ShowsServiceStub()
        let sut = ShowsUseCase(service: serviceStub)
        let stubError = ShowsServiceError.network
        serviceStub.getShowsResponseDataToBeReturned = .failure(stubError)
        let expectedError = ShowsUseCaseError.service(.network)
        expect(sut, page: 0, toCompleteWith: .failure(expectedError))
    }

    func test_execute_shows_whenReceiveNetworkSuccess_shouldReturnUseCaseModel() {
        let serviceStub = ShowsServiceStub()
        let sut = ShowsUseCase(service: serviceStub)
        serviceStub.getShowsResponseDataToBeReturned = .success([.showsMock])
        let expectedResponse = ShowsUseCaseModel.showsMock
        expect(sut, page: 0, toCompleteWith: .success(expectedResponse))
    }

    func test_execute_search_whenNetworkError_shouldReturnNetworkErrorResponse() {
        let serviceStub = ShowsServiceStub()
        let sut = ShowsUseCase(service: serviceStub)
        let stubError = ShowsServiceError.network
        serviceStub.getSearchResponseDataToBeReturned = .failure(stubError)
        let expectedError = ShowsUseCaseError.service(.network)
        expect(sut, showName: "", toCompleteWith: .failure(expectedError))
    }

    func test_execute_search_whenReceiveNetworkSuccess_shouldReturnUseCaseModel() {
        let serviceStub = ShowsServiceStub()
        let sut = ShowsUseCase(service: serviceStub)
        serviceStub.getShowsResponseDataToBeReturned = .success([.showsMock])
        let expectedResponse = SearchUseCaseModel.searchMock
        expect(sut, showName: "", toCompleteWith: .success(expectedResponse))
    }

    // MARK: - Test Helpers

    private func expect(
        _ sut: ShowsUseCase,
        page: Int = 0,
        toCompleteWith expectedResult: Result<ShowsUseCaseModel, ShowsUseCaseError>,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let exp = expectation(description: "Wait for completion")
        sut.execute(page: page) { receivedResult in
            switch (receivedResult, expectedResult) {
            case let (.success(receivedResponse), .success(expectedResponse)):
                XCTAssertEqual(String(describing: receivedResponse), String(describing: expectedResponse),
                               file: file,
                               line: line)
            case let (.failure(receivedError), .failure(expectedError)):
                XCTAssertEqual(String(describing: receivedError), String(describing: expectedError),
                               file: file,
                               line: line)
            default:
                XCTFail("Expected result \(expectedResult), got \(receivedResult) instead", file: file, line: line)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
    }

    private func expect(
        _ sut: ShowsUseCase,
        showName: String = "",
        toCompleteWith expectedResult: Result<SearchUseCaseModel, ShowsUseCaseError>,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let exp = expectation(description: "Wait for completion")
        sut.execute(showName: showName) { receivedResult in
            switch (receivedResult, expectedResult) {
            case let (.success(receivedResponse), .success(expectedResponse)):
                XCTAssertEqual(String(describing: receivedResponse), String(describing: expectedResponse),
                               file: file,
                               line: line)
            case let (.failure(receivedError), .failure(expectedError)):
                XCTAssertEqual(String(describing: receivedError), String(describing: expectedError),
                               file: file,
                               line: line)
            default:
                XCTFail("Expected result \(expectedResult), got \(receivedResult) instead", file: file, line: line)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
    }
}
