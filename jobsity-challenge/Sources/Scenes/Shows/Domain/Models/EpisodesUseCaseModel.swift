//
//  EpisodesUseCaseModel.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 10/01/21.
//

// swiftlint:disable all

import Foundation

struct EpisodesUseCaseModel {
    let data: [Episode]

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
        let image: CommonUseCaseModel.Image?
        let summary: String?
        let links: CommonUseCaseModel.Links
    }
}
