//
//  ShowsUseCaseModel.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 09/01/21.
//
// swiftlint:disable all

struct ShowsUseCaseModel {
    var data: [Show]

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
        let image: CommonUseCaseModel.Image?
        let summary: String?
        let updated: Int
        let links: CommonUseCaseModel.Links
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
}
