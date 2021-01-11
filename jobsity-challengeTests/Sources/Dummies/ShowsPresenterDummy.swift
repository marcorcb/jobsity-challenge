//
//  ShowsPresenterDummy.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation
@testable import jobsity_challenge

final class ShowsPresenterDummy: ShowsPresentationLogic {
    func presentShows(_ response: Shows.ShowsData.Response) {}
    func presentSearchResults(_ response: Shows.SearchData.Response) {}
}
