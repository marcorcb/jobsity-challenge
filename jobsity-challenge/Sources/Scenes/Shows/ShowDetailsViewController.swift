//
//  ShowDetailsViewController.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 09/01/21.
//

import UIKit

protocol ShowDetailsDisplayLogic: AnyObject {
    func displayEpisodesByState(_ state: Shows.EpisodesData.ViewState)
}

protocol ShowDetailsViewControllerDelegate: AnyObject {
    func didSelect(episode: Shows.EpisodesData.ViewData.Episode)
}

final class ShowDetailsViewController: UIViewController {

    // MARK: - Dependencies

    private let interactor: ShowDetailsBusinessLogic
    private var showViewData: Shows.ShowsData.ViewData.Show
    private weak var delegate: ShowDetailsViewControllerDelegate?

    // MARK: - Private Properties

    private var episodesViewData = Dictionary<Int, [Shows.EpisodesData.ViewData.Episode]>()
    private var hiddenSections = Set<Int>()

    // MARK: - Layout

    private lazy var customView: ShowDetailsView = {
        let view = ShowDetailsView(tableViewDataSource: self,
                                   tableViewDelegate: self,
                                   show: showViewData)
        return view
    }()

    // MARK: - Initialization

    init(
        interactor: ShowDetailsBusinessLogic,
        delegate: ShowDetailsViewControllerDelegate,
        showViewData: Shows.ShowsData.ViewData.Show
    ) {
        self.interactor = interactor
        self.delegate = delegate
        self.showViewData = showViewData
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override public func viewDidLoad() {
        super.viewDidLoad()
        customView.setupHeaderViewHeight()
        interactor.onViewDidLoad(for: showViewData.id)
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
        title = showViewData.name
    }

    private func onTappedExapandableView(season: Int) {
        if hiddenSections.contains(season) {
            hiddenSections.remove(season)
        } else {
            hiddenSections.insert(season)
        }

        customView.reloadTableView()
    }

    private func showAlert() {
        let alert = UIAlertController(title: L10n.Alert.title,
                                      message: L10n.Alert.message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: L10n.Alert.confirmation,
                                   style: .default,
                                   handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Display Logic

extension ShowDetailsViewController: ShowDetailsDisplayLogic {
    func displayEpisodesByState(_ state: Shows.EpisodesData.ViewState) {
        switch state {
        case .error:
            customView.stopLoading()
            showAlert()
        case .loading:
            customView.startLoading()
        case let .content(viewData):
            customView.stopLoading()
            episodesViewData = Dictionary(grouping: viewData.episodes, by: { $0.season })
            episodesViewData.keys.forEach({ hiddenSections.insert($0) })
            customView.reloadTableView()
            customView.setupHeaderViewHeightWhenLoaded()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ShowDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return episodesViewData.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let season = section + 1
        if let episodes = episodesViewData[season], !hiddenSections.contains(season) {
            return episodes.count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EpisodeCell = tableView.reusableCell(for: EpisodeCell.className, for: indexPath)
        let season = indexPath.section + 1
        cell.setup(episode: episodesViewData[season]?[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as? ShowCell
        cell?.cancelDownload()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let episodesSeasons = episodesViewData[section + 1] else { return nil }
        let season = section + 1
        let viewData = SeasonExpandableViewData(season: season,
                                                episodeCount: episodesSeasons.count)
        return SeasonExpandableView(viewData: viewData,
                                    onTappedExapandableViewClosure: onTappedExapandableView,
                                    isExpanded: !hiddenSections.contains(season))
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let season = indexPath.section + 1
        guard let episode = episodesViewData[season]?[indexPath.row] else { return }
        delegate?.didSelect(episode: episode)
    }
}
