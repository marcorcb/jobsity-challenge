//
//  ShowsPresenter.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 09/01/21.
//

import Foundation

protocol ShowsPresentationLogic {
    func presentShows(_ response: Shows.ShowsData.Response)
    func presentSearchResults(_ response: Shows.SearchData.Response)
}

final class ShowsPresenter {

    // MARK: - Dependecies

    weak var viewController: ShowsDisplayLogic?

    // MARK: - Private Properties

    // MARK: - Initialization

    // MARK: - Private Methods

    private func getSchedule(_ schedule: ShowsUseCaseModel.Schedule) -> Shows.ShowsData.ViewData.Schedule {
        Shows.ShowsData.ViewData.Schedule(
            time: schedule.time,
            days: schedule.days.map {
                Shows.ShowsData.ViewData.Day(rawValue: $0.rawValue)!
            }
        )
    }

    private func getRating(_ rating: ShowsUseCaseModel.Rating) -> Shows.ShowsData.ViewData.Rating {
        Shows.ShowsData.ViewData.Rating(average: rating.average)
    }

    private func getCountry(_ country: ShowsUseCaseModel.Country?) -> Shows.ShowsData.ViewData.Country? {
        guard let country = country else { return nil }
        return Shows.ShowsData.ViewData.Country(name: country.name, code: country.code, timezone: country.timezone)
    }

    private func getNetwork(_ network: ShowsUseCaseModel.Network?) -> Shows.ShowsData.ViewData.Network? {
        guard let network = network else { return nil }
        return Shows.ShowsData.ViewData.Network(id: network.id,
                                                name: network.name,
                                                country: getCountry(network.country))
    }

    private func getExternals(_ externals: ShowsUseCaseModel.Externals) -> Shows.ShowsData.ViewData.Externals {
        Shows.ShowsData.ViewData.Externals(tvrage: externals.tvrage,
                                           thetvdb: externals.thetvdb,
                                           imdb: externals.imdb)
    }

    private func handleShows(_ data: Shows.ShowsData.Response.DataResponse) {
        var shows = [Shows.ShowsData.ViewData.Show]()
        data.shows.data.forEach {
            let show = Shows.ShowsData.ViewData.Show(
                id: $0.id,
                url: $0.url,
                name: $0.name,
                type: $0.type,
                language: $0.language,
                genres: $0.genres,
                status: Shows.ShowsData.ViewData.Status(
                    rawValue: $0.status.rawValue) ?? .toBeDetermined,
                runtime: $0.runtime,
                premiered: $0.premiered,
                officialSite: $0.officialSite,
                schedule: getSchedule($0.schedule),
                rating: getRating($0.rating),
                weight: $0.weight,
                network: getNetwork($0.network),
                webChannel: getNetwork($0.webChannel),
                externals: getExternals($0.externals),
                image: CommonData.getImage($0.image),
                summary: $0.summary,
                updated: $0.updated,
                links: CommonData.getLinks($0.links)
            )

            shows.append(show)
        }

        if !shows.isEmpty {
            let viewData = Shows.ShowsData.ViewData(shows: shows)
            viewController?.displayShowsByState(.content(viewData))
        } else {
            viewController?.displayShowsByState(.empty)
        }
    }

    private func handleSearchResults(_ data: Shows.SearchData.Response.DataResponse) {
        var searchResults = [Shows.SearchData.ViewData.SearchResult]()
        data.searchResults.data.forEach {
            let searchResult = Shows.SearchData.ViewData.SearchResult(
                score: $0.score,
                show: Shows.ShowsData.ViewData.Show(
                    id: $0.show.id,
                    url: $0.show.url,
                    name: $0.show.name,
                    type: $0.show.type,
                    language: $0.show.language,
                    genres: $0.show.genres,
                    status: Shows.ShowsData.ViewData.Status(
                        rawValue: $0.show.status.rawValue) ?? .toBeDetermined,
                    runtime: $0.show.runtime,
                    premiered: $0.show.premiered,
                    officialSite: $0.show.officialSite,
                    schedule: getSchedule($0.show.schedule),
                    rating: getRating($0.show.rating),
                    weight: $0.show.weight,
                    network: getNetwork($0.show.network),
                    webChannel: getNetwork($0.show.webChannel),
                    externals: getExternals($0.show.externals),
                    image: CommonData.getImage($0.show.image),
                    summary: $0.show.summary,
                    updated: $0.show.updated,
                    links: CommonData.getLinks($0.show.links)
                )
            )

            searchResults.append(searchResult)
        }

        if !searchResults.isEmpty {
            let viewData = Shows.SearchData.ViewData(searchResults: searchResults)
            viewController?.displaySearchResultsByState(.content(viewData))
        } else {
            viewController?.displaySearchResultsByState(.empty)
        }
    }
}

// MARK: - Presentation Logic

extension ShowsPresenter: ShowsPresentationLogic {
    func presentShows(_ response: Shows.ShowsData.Response) {
        switch response.state {
        case .error:
            viewController?.displayShowsByState(.error)
        case .loading:
            viewController?.displayShowsByState(.loading)
        case .empty:
            viewController?.displayShowsByState(.empty)
        case let .content(data):
            handleShows(data)
        }
    }

    func presentSearchResults(_ response: Shows.SearchData.Response) {
        switch response.state {
        case .error:
            viewController?.displaySearchResultsByState(.error)
        case .loading:
            viewController?.displaySearchResultsByState(.loading)
        case .empty:
            viewController?.displaySearchResultsByState(.empty)
        case let .content(data):
            handleSearchResults(data)
        }
    }
}
