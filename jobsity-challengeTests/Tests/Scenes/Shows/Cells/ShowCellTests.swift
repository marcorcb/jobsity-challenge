//
//  ShowCellTests.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import XCTest
import SnapshotTesting
@testable import jobsity_challenge

final class ShowCellTests: XCTestCase {
    func test_showCell_onViewDidLoad() {
        let view = ShowCell()
        view.frame = .init(x: .zero, y: .zero, width: 375, height: 130)
        assertSnapshot(matching: view, as: .image)
    }

    func test_showCell_show() {
        let view = ShowCell()
        view.frame = .init(x: .zero, y: .zero, width: 375, height: 130)
        view.setup(show: .showMock)
        assertSnapshot(matching: view, as: .image)
    }
}
