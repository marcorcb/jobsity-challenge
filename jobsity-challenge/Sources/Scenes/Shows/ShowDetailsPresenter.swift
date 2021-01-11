//
//  ShowDetailsPresenter.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 09/01/21.
//

import Foundation

protocol ShowDetailsPresentationLogic {
    func presentEpisodes(_ response: Shows.EpisodesData.Response)
}

final class ShowDetailsPresenter {

    // MARK: - Dependecies

    weak var viewController: ShowDetailsDisplayLogic?

    // MARK: - Private Properties

    // MARK: - Initialization

    // MARK: - Private Methods

    private func handleEpisodes(_ data: Shows.EpisodesData.Response.DataResponse) {
        var episodes = [Shows.EpisodesData.ViewData.Episode]()
        data.episodes.data.forEach {
            let episode = Shows.EpisodesData.ViewData.Episode(id: $0.id,
                                                              url: $0.url,
                                                              name: $0.name,
                                                              season: $0.season,
                                                              number: $0.number,
                                                              type: $0.type,
                                                              airdate: $0.airdate,
                                                              airtime: $0.airtime,
                                                              airstamp: $0.airstamp,
                                                              runtime: $0.runtime,
                                                              image: CommonData.getImage($0.image),
                                                              summary: $0.summary,
                                                              links: CommonData.getLinks($0.links))
            episodes.append(episode)
        }

        let viewData = Shows.EpisodesData.ViewData(episodes: episodes)
        viewController?.displayEpisodesByState(.content(viewData))
    }
}

// MARK: - Presentation Logic

extension ShowDetailsPresenter: ShowDetailsPresentationLogic {
    func presentEpisodes(_ response: Shows.EpisodesData.Response) {
        switch response.state {
        case .error:
            viewController?.displayEpisodesByState(.error)
        case .loading:
            viewController?.displayEpisodesByState(.loading)
        case let .content(data):
            handleEpisodes(data)
        }
    }
}
