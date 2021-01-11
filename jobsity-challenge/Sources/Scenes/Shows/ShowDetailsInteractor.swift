//
//  ShowDetailsInteractor.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 09/01/21.
//

import Foundation

protocol ShowDetailsBusinessLogic {
    func onViewDidLoad(for showID: Int)
}

final class ShowDetailsInteractor {

    // MARK: - Dependencies

    private let presenter: ShowDetailsPresentationLogic
    private let episodesUseCase: EpisodesUseCaseProvider

    // MARK: - Private Properties

    private var page: Int = 0
    private var episodes: EpisodesUseCaseModel?

    // MARK: - Initialization

    init(
        presenter: ShowDetailsPresentationLogic,
        episodesUseCase: EpisodesUseCaseProvider
    ) {
        self.presenter = presenter
        self.episodesUseCase = episodesUseCase
    }

    // MARK: - Private Methods

    private func loadEpisodesData(for showID: Int) {
        presenter.presentEpisodes(.init(state: .loading))
        episodesUseCase.execute(showID: showID) { [weak self] result in
            switch result {
            case let .success(response):
                self?.episodes = response
                let response = Shows.EpisodesData.Response.DataResponse(episodes: response)
                self?.presenter.presentEpisodes(.init(state: .content(response)))
            case .failure:
                self?.presenter.presentEpisodes(.init(state: .error))
            }
        }
    }
}

// MARK: - Business Logic

extension ShowDetailsInteractor: ShowDetailsBusinessLogic {
    func onViewDidLoad(for showID: Int) {
        loadEpisodesData(for: showID)
    }
}
