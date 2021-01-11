//
//  EpisodeDetailsViewController.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 10/01/21.
//

import UIKit

final class EpisodeDetailsViewController: UIViewController {

    // MARK: - Dependencies

    private var episodeViewData: Shows.EpisodesData.ViewData.Episode

    // MARK: - Private Properties

    // MARK: - Layout

    private lazy var customView: EpisodeDetailsView = {
        let view = EpisodeDetailsView(episode: episodeViewData)
        return view
    }()

    // MARK: - Initialization

    init(episodeViewData: Shows.EpisodesData.ViewData.Episode) {
        self.episodeViewData = episodeViewData
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override public func viewDidLoad() {
        super.viewDidLoad()
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
        title = episodeViewData.name
    }
}
