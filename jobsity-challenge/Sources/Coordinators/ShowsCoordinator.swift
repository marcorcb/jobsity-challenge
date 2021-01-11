//
//  ShowsCoordinator.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 09/01/21.
//

import UIKit

class ShowsCoordinator: Coordinator {

    // MARK: - Public Properties

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: Coordinator?

    // MARK: - Initialization

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Public methods

    func start() {
        setupTabBarController()
        let showsAPI = ShowsAPI()
        let showsUseCase = ShowsUseCase(service: showsAPI)
        let presenter = ShowsPresenter()
        let interactor = ShowsInteractor(presenter: presenter, showsUseCase: showsUseCase)
        let showsViewController = ShowsViewController(interactor: interactor,
                                                      delegate: self)
        presenter.viewController = showsViewController
        navigationController.pushViewController(showsViewController, animated: true)
    }

    // MARK: - Private methods

    private func setupTabBarController() {
        let image = Asset.Images.iconObTv.image.withTintColor(Asset.Colors.black.color,
                                                              renderingMode: .automatic)
        navigationController.tabBarItem = UITabBarItem(
            title: L10n.Shows.title,
            image: image,
            selectedImage: image
        )
    }

    private func showShowDetails(for show: Shows.ShowsData.ViewData.Show) {
        let showsAPI = ShowsAPI()
        let episodesUseCase = EpisodesUseCase(service: showsAPI)
        let presenter = ShowDetailsPresenter()
        let interactor = ShowDetailsInteractor(presenter: presenter, episodesUseCase: episodesUseCase)
        let showDetailsViewController = ShowDetailsViewController(interactor: interactor,
                                                                  delegate: self,
                                                                  showViewData: show)
        presenter.viewController = showDetailsViewController
        navigationController.pushViewController(showDetailsViewController, animated: true)
    }

    private func showEpisodeDetails(for episode: Shows.EpisodesData.ViewData.Episode) {
        let episodeDetailsViewController = EpisodeDetailsViewController(episodeViewData: episode)
        navigationController.pushViewController(episodeDetailsViewController, animated: true)
    }
}

// MARK: - ShowsViewControllerDelegate

extension ShowsCoordinator: ShowsViewControllerDelegate {
    func didSelect(show: Shows.ShowsData.ViewData.Show) {
        showShowDetails(for: show)
    }
}

// MARK: - ShowDetailsViewControllerDelegate

extension ShowsCoordinator: ShowDetailsViewControllerDelegate {
    func didSelect(episode: Shows.EpisodesData.ViewData.Episode) {
        showEpisodeDetails(for: episode)
    }
}
