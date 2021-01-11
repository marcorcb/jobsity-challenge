//
//  ShowDetailsInteractorSpy.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation
@testable import jobsity_challenge

final class ShowDetailsInteractorSpy: ShowDetailsBusinessLogic {

    // MARK: Properties Helpers

    private(set) var onViewDidLoadCalled = false
    private(set) var showIDPassed: Int?

    // MARK: - Business Logic

    func onViewDidLoad(for showID: Int) {
        onViewDidLoadCalled = true
        showIDPassed = showID
    }
}
