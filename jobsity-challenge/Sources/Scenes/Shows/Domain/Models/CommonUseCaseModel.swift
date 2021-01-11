//
//  CommonUseCaseModel.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 10/01/21.
//

// swiftlint:disable all

import Foundation

enum CommonUseCaseModel {
    struct Image {
        let medium, original: String
    }

    struct Links {
        let linksSelf: Episode
        let previousEpisode: Episode?
        let nextEpisode: Episode?

        enum CodingKeys: String, CodingKey {
            case linksSelf = "self"
            case previousEpisode = "previousepisode"
            case nextEpisode = "nextepisode"
        }
    }

    struct Episode {
        let href: String
    }

    static func getImage(_ image: CommonEntity.Image?) -> CommonUseCaseModel.Image? {
        guard let image = image else { return nil }
        return CommonUseCaseModel.Image(medium: image.medium, original: image.original)
    }

    static func getEpisode(_ episode: CommonEntity.Episode?) -> CommonUseCaseModel.Episode? {
        guard let episode = episode else { return nil }
        return CommonUseCaseModel.Episode(href: episode.href)
    }

    static func getLinks(_ links: CommonEntity.Links) -> CommonUseCaseModel.Links {
        CommonUseCaseModel.Links(linksSelf: getEpisode(links.linksSelf)!,
                                previousEpisode: getEpisode(links.previousEpisode),
                                nextEpisode: getEpisode(links.nextEpisode))
    }
}
