//
//  ShowsUseCaseDummy.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation
@testable import jobsity_challenge

final class ShowsUseCaseDummy: ShowsUseCaseProvider {
    func execute(page: Int,
                 then handle: @escaping (Result<ShowsUseCaseModel, ShowsUseCaseError>) -> Void) {}
    func execute(showName: String,
                 then handle: @escaping (Result<SearchUseCaseModel, ShowsUseCaseError>) -> Void) {}
}
