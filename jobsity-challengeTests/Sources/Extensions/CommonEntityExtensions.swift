//
//  CommonEntityExtensions.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

import Foundation
@testable import jobsity_challenge

extension CommonEntity.Image {
    static var imageShowMock: CommonEntity.Image {
        .init(
            medium: "http://static.tvmaze.com/uploads/images/medium_portrait/0/2400.jpg",
            original: "http://static.tvmaze.com/uploads/images/original_untouched/0/2400.jpg"
        )
    }

    static var imageEpisodeMock: CommonEntity.Image {
        .init(
            medium: "http://static.tvmaze.com/uploads/images/medium_landscape/23/59145.jpg",
            original: "http://static.tvmaze.com/uploads/images/original_untouched/23/59145.jpg"
        )
    }
}

extension CommonEntity.Links {
    static var linksShowMock: CommonEntity.Links {
        .init(
            linksSelf: .init(href: "http://api.tvmaze.com/shows/169"),
            previousEpisode: .init(href: "http://api.tvmaze.com/episodes/1704618"),
            nextEpisode: nil
        )
    }

    static var linksEpisodeMock: CommonEntity.Links {
        .init(
            linksSelf: .init(href: "http://api.tvmaze.com/episodes/12192"),
            previousEpisode: nil,
            nextEpisode: nil
        )
    }
}
