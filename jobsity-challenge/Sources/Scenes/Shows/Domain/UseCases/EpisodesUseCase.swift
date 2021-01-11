//
//  EpisodesUseCase.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 10/01/21.
//

import Foundation

protocol EpisodesUseCaseProvider {
    func execute(showID: Int, then handle: @escaping (Result<EpisodesUseCaseModel, ShowsUseCaseError>) -> Void)
}

enum EpisodesUseCaseError: Error {
    case service(ShowsServiceError)
}

final class EpisodesUseCase: EpisodesUseCaseProvider {

    // MARK: - Dependencies

    private let service: ShowsServiceProvider

    // MARK: - Initialization

    init(service: ShowsServiceProvider) {
        self.service = service
    }

    // MARK: - Public Methods

    func execute(showID: Int, then handle: @escaping (Result<EpisodesUseCaseModel, ShowsUseCaseError>) -> Void) {
        service.episodes(showID: showID) { [weak self] result in
            switch result {
            case let .success(entities):
                self?.handleSuccess(input: entities, then: handle)
            case let .failure(error):
                handle(.failure(.service(error)))
            }
        }
    }

    // MARK: - Private methods

    private func handleSuccess(
        input: [EpisodesResponseEntity.Data],
        then: (Result<EpisodesUseCaseModel, ShowsUseCaseError>) -> Void
    ) {
        let items = input
        let domainItems = items.map {
            EpisodesUseCaseModel.Episode(id: $0.id,
                                         url: $0.url,
                                         name: $0.name,
                                         season: $0.season,
                                         number: $0.number,
                                         type: $0.type,
                                         airdate: $0.airdate,
                                         airtime: $0.airtime,
                                         airstamp: $0.airstamp,
                                         runtime: $0.runtime,
                                         image: CommonUseCaseModel.getImage($0.image),
                                         summary: $0.summary,
                                         links: CommonUseCaseModel.getLinks($0.links))
        }

        let domainData = EpisodesUseCaseModel(data: domainItems)
        then(.success(domainData))
    }
}
