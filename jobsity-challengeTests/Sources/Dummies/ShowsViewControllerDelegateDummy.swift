//
//  ShowsViewControllerDelegateDummy.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation
@testable import jobsity_challenge

final class ShowsViewControllerDelegateDummy: ShowsViewControllerDelegate {
    func didSelect(show: Shows.ShowsData.ViewData.Show) {}
}
