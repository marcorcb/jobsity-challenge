//
//  ShowsViewControllerTests.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import XCTest
@testable import jobsity_challenge

final class ShowsViewControllerTests: XCTestCase {
    func test_viewDidLoad_shouldCallInteractorMethodOnViewDidLoad() {
        // Given
        let interactorSpy = ShowsInteractorSpy()
        let sut = makeSUT(interactor: interactorSpy)

        // When
        sut.viewDidLoad()

        // Then
        XCTAssertTrue(interactorSpy.onViewDidLoadCalled)
    }

    // MARK: - Test Helpers

    private func makeSUT(
        interactor: ShowsBusinessLogic = ShowsInteractorDummy(),
        delegate: ShowsViewControllerDelegate = ShowsViewControllerDelegateDummy()
    ) -> ShowsViewController {
        .init(interactor: interactor,
              delegate: delegate)
    }
}
