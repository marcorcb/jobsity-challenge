//
//  ShowsUseCase.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 09/01/21.
//

import Foundation

protocol ShowsUseCaseProvider {
    func execute(page: Int, then handle: @escaping (Result<ShowsUseCaseModel, ShowsUseCaseError>) -> Void)
    func execute(showName: String, then handle: @escaping (Result<SearchUseCaseModel, ShowsUseCaseError>) -> Void)
}

enum ShowsUseCaseError: Error {
    case service(ShowsServiceError)
}

final class ShowsUseCase: ShowsUseCaseProvider {

    // MARK: - Dependencies

    private let service: ShowsServiceProvider

    // MARK: - Initialization

    init(service: ShowsServiceProvider) {
        self.service = service
    }

    // MARK: - Public Methods

    func execute(page: Int, then handle: @escaping (Result<ShowsUseCaseModel, ShowsUseCaseError>) -> Void) {
        service.shows(page: page) { [weak self] result in
            switch result {
            case let .success(entities):
                self?.handleShowsSuccess(input: entities, then: handle)
            case let .failure(error):
                handle(.failure(.service(error)))
            }
        }
    }

    func execute(showName: String, then handle: @escaping (Result<SearchUseCaseModel, ShowsUseCaseError>) -> Void) {
        service.search(showName: showName) { [weak self] result in
            switch result {
            case let .success(entities):
                self?.handleSearchSuccess(input: entities, then: handle)
            case let .failure(error):
                handle(.failure(.service(error)))
            }
        }
    }

    // MARK: - Private Methods

    private func getSchedule(_ schedule: ShowsResponseEntity.Data.Schedule) -> ShowsUseCaseModel.Schedule {
        ShowsUseCaseModel.Schedule(
            time: schedule.time,
            days: schedule.days.map {
                ShowsUseCaseModel.Day(rawValue: $0.rawValue)!
            }
        )
    }

    private func getRating(_ rating: ShowsResponseEntity.Data.Rating) -> ShowsUseCaseModel.Rating {
        ShowsUseCaseModel.Rating(average: rating.average)
    }

    private func getCountry(_ country: ShowsResponseEntity.Data.Country?) -> ShowsUseCaseModel.Country? {
        guard let country = country else { return nil }
        return ShowsUseCaseModel.Country(name: country.name, code: country.code, timezone: country.timezone)
    }

    private func getNetwork(_ network: ShowsResponseEntity.Data.Network?) -> ShowsUseCaseModel.Network? {
        guard let network = network else { return nil }
        return ShowsUseCaseModel.Network(id: network.id, name: network.name, country: getCountry(network.country))
    }

    private func getExternals(_ externals: ShowsResponseEntity.Data.Externals) -> ShowsUseCaseModel.Externals {
        ShowsUseCaseModel.Externals(tvrage: externals.tvrage, thetvdb: externals.thetvdb, imdb: externals.imdb)
    }

    private func handleShowsSuccess(
        input: [ShowsResponseEntity.Data],
        then: (Result<ShowsUseCaseModel, ShowsUseCaseError>) -> Void
    ) {
        let items = input
        let domainItems = items.map {
            ShowsUseCaseModel.Show(
                id: $0.id,
                url: $0.url,
                name: $0.name,
                type: $0.type,
                language: $0.language,
                genres: $0.genres,
                status: ShowsUseCaseModel.Status(rawValue: $0.status.rawValue) ?? .toBeDetermined,
                runtime: $0.runtime,
                premiered: $0.premiered,
                officialSite: $0.officialSite,
                schedule: getSchedule($0.schedule),
                rating: getRating($0.rating),
                weight: $0.weight,
                network: getNetwork($0.network),
                webChannel: getNetwork($0.webChannel),
                externals: getExternals($0.externals),
                image: CommonUseCaseModel.getImage($0.image),
                summary: $0.summary,
                updated: $0.updated,
                links: CommonUseCaseModel.getLinks($0.links))
        }

        let domainData = ShowsUseCaseModel(data: domainItems)
        then(.success(domainData))
    }

    private func handleSearchSuccess(
        input: [SearchResponseEntity.Data],
        then: (Result<SearchUseCaseModel, ShowsUseCaseError>) -> Void
    ) {
        let items = input
        let domainItems = items.map {
            SearchUseCaseModel.SearchResult(
                score: $0.score,
                show: ShowsUseCaseModel.Show(
                    id: $0.show.id,
                    url: $0.show.url,
                    name: $0.show.name,
                    type: $0.show.type,
                    language: $0.show.language,
                    genres: $0.show.genres,
                    status: ShowsUseCaseModel.Status(rawValue: $0.show.status.rawValue) ?? .toBeDetermined,
                    runtime: $0.show.runtime,
                    premiered: $0.show.premiered,
                    officialSite: $0.show.officialSite,
                    schedule: getSchedule($0.show.schedule),
                    rating: getRating($0.show.rating),
                    weight: $0.show.weight,
                    network: getNetwork($0.show.network),
                    webChannel: getNetwork($0.show.webChannel),
                    externals: getExternals($0.show.externals),
                    image: CommonUseCaseModel.getImage($0.show.image),
                    summary: $0.show.summary,
                    updated: $0.show.updated,
                    links: CommonUseCaseModel.getLinks($0.show.links))
            )
        }

        let domainData = SearchUseCaseModel(data: domainItems)
        then(.success(domainData))
    }
}
