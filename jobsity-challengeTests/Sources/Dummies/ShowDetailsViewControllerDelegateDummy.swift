//
//  ShowDetailsViewControllerDelegateDummy.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation
@testable import jobsity_challenge

final class ShowDetailsViewControllerDelegateDummy: ShowDetailsViewControllerDelegate {
    func didSelect(episode: Shows.EpisodesData.ViewData.Episode) {}
}
