//
//  EpisodesUseCaseTests.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import XCTest
@testable import jobsity_challenge

final class EpisodesUseCaseTests: XCTestCase {
    func test_execute_shows_whenNetworkError_shouldReturnNetworkErrorResponse() {
        let serviceStub = ShowsServiceStub()
        let sut = EpisodesUseCase(service: serviceStub)
        let stubError = ShowsServiceError.network
        serviceStub.getEpisodesResponseDataToBeReturned = .failure(stubError)
        let expectedError = EpisodesUseCaseError.service(.network)
        expect(sut, toCompleteWith: .failure(expectedError))
    }

    func test_execute_shows_whenReceiveNetworkSuccess_shouldReturnUseCaseModel() {
        let serviceStub = ShowsServiceStub()
        let sut = EpisodesUseCase(service: serviceStub)
        serviceStub.getEpisodesResponseDataToBeReturned = .success([.episodeMock])
        let expectedResponse = EpisodesUseCaseModel.episodesMock
        expect(sut, toCompleteWith: .success(expectedResponse))
    }

    // MARK: - Test Helpers

    private func expect(
        _ sut: EpisodesUseCase,
        showID: Int = 0,
        toCompleteWith expectedResult: Result<EpisodesUseCaseModel, EpisodesUseCaseError>,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let exp = expectation(description: "Wait for completion")
        sut.execute(showID: showID) { receivedResult in
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
