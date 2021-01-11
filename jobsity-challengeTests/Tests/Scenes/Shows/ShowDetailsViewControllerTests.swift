//
//  ShowDetailsViewControllerTests.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import XCTest
@testable import jobsity_challenge

final class ShowDetailsViewControllerTests: XCTestCase {
    func test_viewDidLoad_shouldCallInteractorMethodOnViewDidLoad() {
        // Given
        let interactorSpy = ShowDetailsInteractorSpy()
        let sut = makeSUT(interactor: interactorSpy)

        // When
        sut.viewDidLoad()

        // Then
        XCTAssertTrue(interactorSpy.onViewDidLoadCalled)
    }

    // MARK: - Test Helpers

    private func makeSUT(
        interactor: ShowDetailsBusinessLogic = ShowDetailsInteractorDummy(),
        delegate: ShowDetailsViewControllerDelegate = ShowDetailsViewControllerDelegateDummy(),
        showViewData: Shows.ShowsData.ViewData.Show = .showMock
    ) -> ShowDetailsViewController {
        .init(interactor: interactor,
              delegate: delegate,
              showViewData: showViewData)
    }
}
