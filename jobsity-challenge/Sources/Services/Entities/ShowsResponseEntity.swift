//
//  ShowsResponseEntity.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 09/01/21.
//

// swiftlint:disable all

import Foundation

enum ShowsResponseEntity {
    struct Data: Codable {
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
        let image: CommonEntity.Image?
        let summary: String?
        let updated: Int
        let links: CommonEntity.Links

        enum CodingKeys: String, CodingKey {
            case id, url, name, type, language, genres, status, runtime, premiered, officialSite, schedule,
                 rating, weight, network, webChannel, externals, image, summary, updated
            case links = "_links"
        }

        enum Status: String, Codable {
            case ended = "Ended"
            case running = "Running"
            case toBeDetermined = "To Be Determined"
            case inDevelopment = "In Development"
        }

        struct Schedule: Codable {
            let time: String
            let days: [Day]
        }

        enum Day: String, Codable {
            case friday = "Friday"
            case monday = "Monday"
            case saturday = "Saturday"
            case sunday = "Sunday"
            case thursday = "Thursday"
            case tuesday = "Tuesday"
            case wednesday = "Wednesday"
        }

        struct Rating: Codable {
            let average: Double?
        }

        struct Network: Codable {
            let id: Int
            let name: String
            let country: Country?
        }

        struct Country: Codable {
            let name: String
            let code: String
            let timezone: String
        }

        struct Externals: Codable {
            let tvrage: Int?
            let thetvdb: Int?
            let imdb: String?
        }
    }
}
