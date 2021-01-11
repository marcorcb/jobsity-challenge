//
//  ShowsErrorViewTests.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import XCTest
import SnapshotTesting
@testable import jobsity_challenge

final class ShowsErrorViewTests: XCTestCase {
    private func onTappedReloadButtonClosureDummy() {}

    func test_showsErrorView_onViewDidLoad() {
        let view = ShowsErrorView(onTappedReloadButtonClosure: onTappedReloadButtonClosureDummy)
        view.frame = .init(x: .zero, y: .zero, width: 375, height: 603)
        assertSnapshot(matching: view, as: .image)
    }
}
