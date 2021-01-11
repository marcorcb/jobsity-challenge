//
//  ShowsInteractorDummy.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation
@testable import jobsity_challenge

final class ShowsInteractorDummy: ShowsBusinessLogic {
    func onViewDidLoad() {}
    func checkPagination(lastDisplayedCount: Int) {}
    func search(for seriesName: String) {}
}
