//
//  ShowsCommonModel.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 10/01/21.
//

// swiftlint:disable all

import Foundation

enum CommonData {
    struct CommonViewData {
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
    }

    static func getImage(_ image: CommonUseCaseModel.Image?) -> CommonData.CommonViewData.Image? {
        guard let image = image else { return nil }
        return CommonData.CommonViewData.Image(medium: image.medium,
                                               original: image.original)
    }

    static func getEpisode(_ episode: CommonUseCaseModel.Episode?) -> CommonData.CommonViewData.Episode? {
        guard let episode = episode else { return nil }
        return CommonData.CommonViewData.Episode(href: episode.href)
    }

    static func getLinks(_ links: CommonUseCaseModel.Links) -> CommonData.CommonViewData.Links {
        CommonData.CommonViewData.Links(linksSelf: getEpisode(links.linksSelf)!,
                                previousEpisode: getEpisode(links.previousEpisode),
                                nextEpisode: getEpisode(links.nextEpisode))
    }
}
