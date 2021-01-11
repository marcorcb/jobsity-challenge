//
//  EpisodesUseCaseModelExtensions.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

// swiftlint:disable all

import Foundation
@testable import jobsity_challenge

extension EpisodesUseCaseModel {
    static var episodesMock: EpisodesUseCaseModel {
        .init(data: [.episodeMock])
    }

    static var emptyMock: EpisodesUseCaseModel {
        .init(data: [])
    }
}

extension EpisodesUseCaseModel.Episode {
    static var episodeMock: EpisodesUseCaseModel.Episode {
        .init(
            id: 12192,
            url: "http://www.tvmaze.com/episodes/12192/breaking-bad-1x01-pilot",
            name: "Pilot",
            season: 1,
            number: 1,
            type: "regular",
            airdate: "2008-01-20",
            airtime: "22:00",
            airstamp: "2008-01-21T03:00:00+00:00",
            runtime: 60,
            image: .imageEpisodeMock,
            summary: "<p>A high-school chemistry teacher (Bryan Cranston) is diagnosed with a deadly cancer, so he puts his expertise to use and teams with an ex-student (Aaron Paul) to manufacture top-grade crystal meth in hopes of providing for his family after he's gone.</p>",
            links: .linksEpisodeMock
        )
    }
}
