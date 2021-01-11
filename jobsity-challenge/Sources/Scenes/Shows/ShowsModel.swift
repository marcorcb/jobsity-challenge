//
//  ShowsModel.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 09/01/21.
//

// swiftlint:disable all

import Foundation

enum Shows {
    enum ShowsData {
        struct Response {
            let state: State

            enum State {
                case error
                case loading
                case empty
                case content(DataResponse)
            }

            struct DataResponse {
                let shows: ShowsUseCaseModel
            }
        }

        enum ViewState {
            case error
            case loading
            case empty
            case content(ViewData)
        }

        struct ViewData {
            let shows: [Show]
            let hasError: Bool
            let isLoading: Bool
            let isEmpty: Bool

            struct Show {
                let id: Int
                let url: String
                let name: String
                let type: String
                let language: String
                let genres: [String]
                let status: Status
                let runtime: Int?
                let premiered: String?
                let officialSite: String?
                let schedule: Schedule
                let rating: Rating
                let weight: Int
                let network, webChannel: Network?
                let externals: Externals
                let image: CommonData.CommonViewData.Image?
                let summary: String?
                let updated: Int
                let links: CommonData.CommonViewData.Links
            }

            enum Status: String {
                case ended = "Ended"
                case running = "Running"
                case toBeDetermined = "To Be Determined"
            }

            struct Schedule {
                let time: String
                let days: [Day]
            }

            enum Day: String {
                case friday = "Friday"
                case monday = "Monday"
                case saturday = "Saturday"
                case sunday = "Sunday"
                case thursday = "Thursday"
                case tuesday = "Tuesday"
                case wednesday = "Wednesday"
            }

            struct Rating {
                let average: Double?
            }

            struct Network {
                let id: Int
                let name: String
                let country: Country?
            }

            struct Country {
                let name: String
                let code: String
                let timezone: String
            }

            struct Externals {
                let tvrage: Int?
                let thetvdb: Int?
                let imdb: String?
            }

            init(shows: [Show]) {
                self.shows = shows
                hasError = false
                isLoading = false
                isEmpty = false
            }

            init(hasError: Bool) {
                shows = []
                self.hasError = true
                isLoading = false
                isEmpty = false
            }

            init(isLoading: Bool) {
                shows = []
                hasError = false
                self.isLoading = true
                isEmpty = false
            }

            init(isEmpty: Bool) {
                shows = []
                hasError = false
                isLoading = false
                self.isEmpty = true
            }

            static let error = ViewData(hasError: true)
            static let loading = ViewData(isLoading: true)
            static let empty = ViewData(isEmpty: true)
            static let `default` = ViewData(isLoading: true)
        }
    }

    enum SearchData {
        struct Response {
            let state: State

            enum State {
                case error
                case loading
                case empty
                case content(DataResponse)
            }

            struct DataResponse {
                let searchResults: SearchUseCaseModel
            }
        }

        enum ViewState {
            case error
            case loading
            case empty
            case content(ViewData)
        }

        struct ViewData {
            let searchResults: [SearchResult]
            let hasError: Bool
            let isLoading: Bool
            let isEmpty: Bool

            struct SearchResult {
                let score: Double
                let show: ShowsData.ViewData.Show
            }

            init(searchResults: [SearchResult]) {
                self.searchResults = searchResults
                hasError = false
                isLoading = false
                isEmpty = false
            }

            init(hasError: Bool) {
                searchResults = []
                self.hasError = true
                isLoading = false
                isEmpty = false
            }

            init(isLoading: Bool) {
                searchResults = []
                hasError = false
                self.isLoading = true
                isEmpty = false
            }

            init(isEmpty: Bool) {
                searchResults = []
                hasError = false
                isLoading = false
                self.isEmpty = true
            }

            static let error = ViewData(hasError: true)
            static let loading = ViewData(isLoading: true)
            static let empty = ViewData(isEmpty: true)
            static let `default` = ViewData(isLoading: true)
        }
    }

    enum EpisodesData {
        struct Response {
            let state: State

            enum State {
                case error
                case loading
                case content(DataResponse)
            }

            struct DataResponse {
                let episodes: EpisodesUseCaseModel
            }
        }

        enum ViewState {
            case error
            case loading
            case content(ViewData)
        }

        struct ViewData {
            let episodes: [Episode]
            let hasError: Bool
            let isLoading: Bool
            let isEmpty: Bool

            struct Episode {
                let id: Int
                let url: String
                let name: String
                let season, number: Int
                let type: String
                let airdate: String
                let airtime: String
                let airstamp: String
                let runtime: Int
                let image: CommonData.CommonViewData.Image?
                let summary: String?
                let links: CommonData.CommonViewData.Links
            }

            init(episodes: [Episode]) {
                self.episodes = episodes
                hasError = false
                isLoading = false
                isEmpty = false
            }

            init(hasError: Bool) {
                episodes = []
                self.hasError = true
                isLoading = false
                isEmpty = false
            }

            init(isLoading: Bool) {
                episodes = []
                hasError = false
                self.isLoading = true
                isEmpty = false
            }

            init(isEmpty: Bool) {
                episodes = []
                hasError = false
                isLoading = false
                self.isEmpty = true
            }

            static let error = ViewData(hasError: true)
            static let loading = ViewData(isLoading: true)
            static let empty = ViewData(isEmpty: true)
            static let `default` = ViewData(isLoading: true)
        }
    }
}
