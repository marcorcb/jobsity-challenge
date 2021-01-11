//
//  ShowsInteractor.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 09/01/21.
//

import Foundation

protocol ShowsBusinessLogic {
    func onViewDidLoad()
    func checkPagination(lastDisplayedCount: Int)
    func search(for seriesName: String)
}

final class ShowsInteractor {

    // MARK: - Dependencies

    private let presenter: ShowsPresentationLogic
    private let showsUseCase: ShowsUseCaseProvider

    // MARK: - Private Properties

    private var page: Int = 0
    private var nextPageCalled: Bool = false
    private var shows: ShowsUseCaseModel?
    private var searchResults: SearchUseCaseModel?

    // MARK: - Initialization

    init(
        presenter: ShowsPresentationLogic,
        showsUseCase: ShowsUseCaseProvider
    ) {
        self.presenter = presenter
        self.showsUseCase = showsUseCase
    }

    // MARK: - Private Methods

    private func loadShowsData() {
        presenter.presentShows(.init(state: .loading))
        showsUseCase.execute(page: page) { [weak self] result in
            switch result {
            case let .success(response):
                self?.shows = response
                let response = Shows.ShowsData.Response.DataResponse(shows: response)
                self?.presenter.presentShows(.init(state: .content(response)))
            case .failure:
                self?.presenter.presentShows(.init(state: .error))
            }
        }
    }

    private func loadNexPageShowsData() {
        showsUseCase.execute(page: page) { [weak self] result in
            self?.nextPageCalled = false
            switch result {
            case let .success(response):
                self?.shows?.data.append(contentsOf: response.data)
                guard let shows = self?.shows else { return }
                let response = Shows.ShowsData.Response.DataResponse(shows: shows)
                self?.presenter.presentShows(.init(state: .content(response)))
            case .failure:
                self?.presenter.presentShows(.init(state: .error))
            }
        }
    }

    private func searchShow(with showName: String) {
        presenter.presentShows(.init(state: .loading))
        showsUseCase.execute(showName: showName) { [weak self] result in
            switch result {
            case let .success(response):
                self?.searchResults = response
                let response = Shows.SearchData.Response.DataResponse(searchResults: response)
                self?.presenter.presentSearchResults(.init(state: .content(response)))
            case .failure:
                self?.presenter.presentSearchResults(.init(state: .error))
            }
        }
    }
}

// MARK: - Business Logic

extension ShowsInteractor: ShowsBusinessLogic {
    func onViewDidLoad() {
        page = 0
        loadShowsData()
    }

    func checkPagination(lastDisplayedCount: Int) {
        guard let shows = shows else { return }
        if lastDisplayedCount + 20 >= shows.data.count && nextPageCalled == false {
            page+=1
            nextPageCalled = true
            loadNexPageShowsData()
        }
    }

    func search(for seriesName: String) {
        searchShow(with: seriesName)
    }
}
