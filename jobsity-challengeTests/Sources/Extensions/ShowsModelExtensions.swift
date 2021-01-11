//
//  ShowsModelExtensions.swift
//  jobsity-challengeTests
//
//  Created by Marco Braga on 11/01/21.
//

// swiftlint:disable all

import Foundation
@testable import jobsity_challenge

extension Shows.ShowsData.ViewData {
    static var showsMock: Shows.ShowsData.ViewData {
        .init(shows: [.showMock])
    }

    static var emptyMock: Shows.ShowsData.ViewData {
        .init(shows: [])
    }
}

extension Shows.ShowsData.ViewData.Show {
    static var showMock: Shows.ShowsData.ViewData.Show {
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

extension Shows.ShowsData.ViewData.Schedule {
    static var scheduleMock: Shows.ShowsData.ViewData.Schedule {
        .init(
            time: "22:00",
            days: [.sunday]
        )
    }
}

extension Shows.ShowsData.ViewData.Rating {
    static var ratingMock: Shows.ShowsData.ViewData.Rating {
        .init(average: 9.2)
    }
}

extension Shows.ShowsData.ViewData.Network {
    static var networkMock: Shows.ShowsData.ViewData.Network {
        .init(
            id: 20,
            name: "AMC",
            country: .countryMock
        )
    }
}

extension Shows.ShowsData.ViewData.Country {
    static var countryMock: Shows.ShowsData.ViewData.Country {
        .init(
            name: "United States",
              code: "US",
              timezone: "America/New_York"
        )
    }
}

extension Shows.ShowsData.ViewData.Externals {
    static var externalMock: Shows.ShowsData.ViewData.Externals {
        .init(
            tvrage: 18164,
              thetvdb: 81189,
              imdb: "tt0903747"
        )
    }
}

extension Shows.SearchData.ViewData {
    static var searchMock: Shows.SearchData.ViewData {
        .init(searchResults: [.searchResultMock])
    }

    static var emptyMock: Shows.ShowsData.ViewData {
        .init(shows: [])
    }
}

extension Shows.SearchData.ViewData.SearchResult {
    static var searchResultMock: Shows.SearchData.ViewData.SearchResult {
        .init(
            score: 17.376015,
            show: .showMock
        )
    }
}

extension Shows.EpisodesData.ViewData {
    static var episodesMock: Shows.EpisodesData.ViewData {
        .init(episodes: [.episodeMock])
    }

    static var emptyMock: Shows.EpisodesData.ViewData {
        .init(episodes: [])
    }
}

extension Shows.EpisodesData.ViewData.Episode {
    static var episodeMock: Shows.EpisodesData.ViewData.Episode {
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

extension Shows.ShowsData.Response {
    static var contentMock: Shows.ShowsData.Response {
        .init(state: .content(.dataResponseMock))
    }

    static var loadingMock: Shows.ShowsData.Response {
        .init(state: .loading)
    }

    static var emptyContentMock: Shows.ShowsData.Response {
        .init(state: .content(.dataResponseEmptyMock))
    }

    static var emptyMock: Shows.ShowsData.Response {
        .init(state: .empty)
    }

    static var errorMock: Shows.ShowsData.Response {
        .init(state: .error)
    }
}

extension Shows.ShowsData.Response.DataResponse {
    static var dataResponseMock: Shows.ShowsData.Response.DataResponse {
        .init(shows: .showsMock)
    }

    static var dataResponseEmptyMock: Shows.ShowsData.Response.DataResponse {
        .init(shows: .emptyMock)
    }
}

extension Shows.SearchData.Response {
    static var contentMock: Shows.SearchData.Response {
        .init(state: .content(.dataResponseMock))
    }

    static var loadingMock: Shows.SearchData.Response {
        .init(state: .loading)
    }

    static var emptyContentMock: Shows.SearchData.Response {
        .init(state: .content(.dataResponseEmptyMock))
    }

    static var emptyMock: Shows.SearchData.Response {
        .init(state: .empty)
    }

    static var errorMock: Shows.SearchData.Response {
        .init(state: .error)
    }
}

extension Shows.SearchData.Response.DataResponse {
    static var dataResponseMock: Shows.SearchData.Response.DataResponse {
        .init(searchResults: .searchMock)
    }

    static var dataResponseEmptyMock: Shows.SearchData.Response.DataResponse {
        .init(searchResults: .emptyMock)
    }
}

extension Shows.EpisodesData.Response {
    static var contentMock: Shows.EpisodesData.Response {
        .init(state: .content(.dataResponseMock))
    }

    static var loadingMock: Shows.EpisodesData.Response {
        .init(state: .loading)
    }

    static var errorMock: Shows.EpisodesData.Response {
        .init(state: .error)
    }
}

extension Shows.EpisodesData.Response.DataResponse {
    static var dataResponseMock: Shows.EpisodesData.Response.DataResponse {
        .init(episodes: .episodesMock)
    }
}
