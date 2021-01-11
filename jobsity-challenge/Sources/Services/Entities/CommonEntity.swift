//
//  CommonEntity.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 09/01/21.
//

// swiftlint:disable all

import Foundation

enum CommonEntity {
    struct Image: Codable {
        let medium, original: String
    }

    struct Links: Codable {
        let linksSelf: Episode
        let previousEpisode: Episode?
        let nextEpisode: Episode?

        enum CodingKeys: String, CodingKey {
            case linksSelf = "self"
            case previousEpisode = "previousepisode"
            case nextEpisode = "nextepisode"
        }
    }

    struct Episode: Codable {
        let href: String
    }
}
