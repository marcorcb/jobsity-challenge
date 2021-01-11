//
//  EpisodeCellTests.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import XCTest
import SnapshotTesting
@testable import jobsity_challenge

final class EpisodeCellTests: XCTestCase {
    func test_episodeCell_onViewDidLoad() {
        let view = EpisodeCell()
        view.frame = .init(x: .zero, y: .zero, width: 375, height: 100)
        assertSnapshot(matching: view, as: .image)
    }

    func test_episodeCell_episode() {
        let view = EpisodeCell()
        view.frame = .init(x: .zero, y: .zero, width: 375, height: 100)
        view.setup(episode: .episodeMock)
        assertSnapshot(matching: view, as: .image)
    }
}
