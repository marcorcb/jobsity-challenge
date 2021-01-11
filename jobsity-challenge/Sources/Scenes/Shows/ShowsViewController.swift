//
//  ShowsViewController.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 09/01/21.
//

import UIKit

protocol ShowsDisplayLogic: AnyObject {
    func displayShowsByState(_ state: Shows.ShowsData.ViewState)
    func displaySearchResultsByState(_ state: Shows.SearchData.ViewState)
}

protocol ShowsViewControllerDelegate: AnyObject {
    func didSelect(show: Shows.ShowsData.ViewData.Show)
}

final class ShowsViewController: UIViewController {

    // MARK: - Dependencies

    private let interactor: ShowsBusinessLogic
    private weak var delegate: ShowsViewControllerDelegate?

    // MARK: - Private Properties

    private var showsViewData = [Shows.ShowsData.ViewData.Show]()
    private var searchResultsViewData = [Shows.SearchData.ViewData.SearchResult]()
    private var isSearching: Bool = false

    // MARK: - Layout

    private lazy var customView: ShowsView = {
        let view = ShowsView(
            tableViewDataSource: self,
            tableViewDelegate: self,
            searchBarDelegate: self,
            onTappedReloadButtonClosure: onTappedReloadButtonClosure
        )
        return view
    }()

    // MARK: - Initialization

    init(
        interactor: ShowsBusinessLogic,
        delegate: ShowsViewControllerDelegate
    ) {
        self.interactor = interactor
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override public func viewDidLoad() {
        super.viewDidLoad()
        interactor.onViewDidLoad()
        hideKeyboardWhenTappedAround()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }

    override public func loadView() {
        view = customView
    }

    // MARK: - Private Methods

    private func configureNavigationBar() {
        title = L10n.Shows.title
    }

    private func onTappedReloadButtonClosure() {
        interactor.onViewDidLoad()
    }
}

// MARK: - Display Logic

extension ShowsViewController: ShowsDisplayLogic {
    func displayShowsByState(_ state: Shows.ShowsData.ViewState) {
        switch state {
        case .error:
            customView.stopLoading()
            customView.errorView(isHidden: false)
        case .loading:
            customView.startLoading()
            customView.emptyView(isHidden: true)
            customView.errorView(isHidden: true)
        case .empty:
            customView.stopLoading()
            customView.emptyView(isHidden: false)
            customView.errorView(isHidden: true)
        case let .content(viewData):
            customView.stopLoading()
            showsViewData = viewData.shows
            customView.emptyView(isHidden: true)
            customView.errorView(isHidden: true)
            customView.reloadTableView()
        }
    }

    func displaySearchResultsByState(_ state: Shows.SearchData.ViewState) {
        switch state {
        case .error:
            customView.stopLoading()
            customView.errorView(isHidden: false)
        case .loading:
            customView.startLoading()
            customView.emptyView(isHidden: true)
            customView.errorView(isHidden: true)
        case .empty:
            customView.stopLoading()
            customView.emptyView(isHidden: false, isSearching: true)
            customView.errorView(isHidden: true)
        case let .content(viewData):
            customView.stopLoading()
            searchResultsViewData = viewData.searchResults
            customView.emptyView(isHidden: true)
            customView.errorView(isHidden: true)
            customView.reloadTableView()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ShowsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return searchResultsViewData.count
        } else {
            return showsViewData.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ShowCell = tableView.reusableCell(for: ShowCell.className, for: indexPath)
        if isSearching {
            cell.setup(show: searchResultsViewData[indexPath.row].show)
        } else {
            cell.setup(show: showsViewData[indexPath.row])
        }
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        interactor.checkPagination(lastDisplayedCount: indexPath.row)
    }

    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as? ShowCell
        cell?.cancelDownload()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
        if isSearching {
            delegate?.didSelect(show: searchResultsViewData[indexPath.row].show)
        } else {
            delegate?.didSelect(show: showsViewData[indexPath.row])
        }
    }
}

// MARK: - UISearchBarDelegate

extension ShowsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            customView.reloadTableView()
            if showsViewData.isEmpty { displayShowsByState(.empty) }
        } else {
            isSearching = true
            interactor.search(for: searchText)
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = .none
        searchBar.endEditing(true)
        customView.reloadTableView()
    }
}
