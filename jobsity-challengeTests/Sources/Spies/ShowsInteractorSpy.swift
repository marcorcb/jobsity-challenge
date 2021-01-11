//
//  ShowsInteractorSpy.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation
@testable import jobsity_challenge

final class ShowsInteractorSpy: ShowsBusinessLogic {

    // MARK: Properties Helpers

    private(set) var onViewDidLoadCalled = false
    private(set) var checkPaginationCalled = false
    private(set) var searchCalled = false
    private(set) var lastDisplayedCountPassed: Int?
    private(set) var seriesNamePassed: String?

    // MARK: - Business Logic

    func onViewDidLoad() {
        onViewDidLoadCalled = true
    }

    func checkPagination(lastDisplayedCount: Int) {
        checkPaginationCalled = true
        lastDisplayedCountPassed = lastDisplayedCount
    }

    func search(for seriesName: String) {
        searchCalled = true
        seriesNamePassed = seriesName
    }
}
