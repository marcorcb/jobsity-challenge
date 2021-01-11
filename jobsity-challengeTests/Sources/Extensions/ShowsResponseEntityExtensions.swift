//
//  ShowsResponseEntityExtensions.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

// swiftlint:disable all

import Foundation
@testable import jobsity_challenge

extension ShowsResponseEntity.Data {
    static var showsMock: ShowsResponseEntity.Data {
        .init(
            id: 169,
            url: "http://www.tvmaze.com/shows/169/breaking-bad",
            name: "Breaking Bad",
            type: "Scripted",
            language: "English",
            genres: ["Drama", "Crime", "Thriller"],
            status: .ended,
            runtime: 60,
            premiered: "2008-01-20",
            officialSite: "http://www.amc.com/shows/breaking-bad",
            schedule: .scheduleMock,
            rating: .ratingMock,
            weight: 96,
            network: .networkMock,
            webChannel: nil,
            externals: .externalMock,
            image: .imageShowMock,
            summary: "<p><b>Breaking Bad</b> follows protagonist Walter White, a chemistry teacher who lives in New Mexico with his wife and teenage son who has cerebral palsy. White is diagnosed with Stage III cancer and given a prognosis of two years left to live. With a new sense of fearlessness based on his medical prognosis, and a desire to secure his family's financial security, White chooses to enter a dangerous world of drugs and crime and ascends to power in this world. The series explores how a fatal diagnosis such as White's releases a typical man from the daily concerns and constraints of normal society and follows his transformation from mild family man to a kingpin of the drug trade.</p>",
            updated: 1610303431,
            links: .linksShowMock
        )
    }
}

extension ShowsResponseEntity.Data.Schedule {
    static var scheduleMock: ShowsResponseEntity.Data.Schedule {
        .init(
            time: "22:00",
            days: [.sunday]
        )
    }
}

extension ShowsResponseEntity.Data.Rating {
    static var ratingMock: ShowsResponseEntity.Data.Rating {
        .init(average: 9.2)
    }
}

extension ShowsResponseEntity.Data.Network {
    static var networkMock: ShowsResponseEntity.Data.Network {
        .init(
            id: 20,
            name: "AMC",
            country: .countryMock
        )
    }
}

extension ShowsResponseEntity.Data.Country {
    static var countryMock: ShowsResponseEntity.Data.Country {
        .init(
            name: "United States",
              code: "US",
              timezone: "America/New_York"
        )
    }
}

extension ShowsResponseEntity.Data.Externals {
    static var externalMock: ShowsResponseEntity.Data.Externals {
        .init(
            tvrage: 18164,
              thetvdb: 81189,
              imdb: "tt0903747"
        )
    }
}
