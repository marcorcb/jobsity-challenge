//
//  ShowsEmptyViewTests.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import XCTest
import SnapshotTesting
@testable import jobsity_challenge

final class ShowsEmptyViewTests: XCTestCase {
    private func onTappedReloadButtonClosureDummy() {}

    func test_showsEmptyView_onViewDidLoad() {
        let view = ShowsEmptyView(onTappedReloadButtonClosure: onTappedReloadButtonClosureDummy)
        view.frame = .init(x: .zero, y: .zero, width: 375, height: 603)
        assertSnapshot(matching: view, as: .image)
    }

    func test_showsEmptyView_isSearching() {
        let view = ShowsEmptyView(onTappedReloadButtonClosure: onTappedReloadButtonClosureDummy)
        view.setupUI(true)
        view.frame = .init(x: .zero, y: .zero, width: 375, height: 603)
        assertSnapshot(matching: view, as: .image)
    }

    func test_showsEmptyView_isNotSearching() {
        let view = ShowsEmptyView(onTappedReloadButtonClosure: onTappedReloadButtonClosureDummy)
        view.setupUI(false)
        view.frame = .init(x: .zero, y: .zero, width: 375, height: 603)
        assertSnapshot(matching: view, as: .image)
    }
}
