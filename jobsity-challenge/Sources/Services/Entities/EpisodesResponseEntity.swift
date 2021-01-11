//
//  EpisodesResponseEntity.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 10/01/21.
//

// swiftlint:disable all

import Foundation

enum EpisodesResponseEntity {
    struct Data: Codable {
        let id: Int
        let url: String
        let name: String
        let season, number: Int
        let type: String
        let airdate: String
        let airtime: String
        let airstamp: String
        let runtime: Int
        let image: CommonEntity.Image?
        let summary: String?
        let links: CommonEntity.Links

        enum CodingKeys: String, CodingKey {
            case id, url, name, season, number, type, airdate, airtime, airstamp, runtime, image, summary
            case links = "_links"
        }
    }
}
