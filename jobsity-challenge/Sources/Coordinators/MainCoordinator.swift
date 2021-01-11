//
//  MainCoordinator.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 08/01/21.
//

import UIKit

class MainCoordinator: Coordinator {

    // MARK: - Public Properties

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var tabBarController: UITabBarController

    // MARK: - Initialization

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = UITabBarController()
    }

    // MARK: - Public methods

    func start() {
        createChildCoordinators()
        setupTabBarController()
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setViewControllers([tabBarController], animated: true)
    }

    // MARK: - Private methods

    private func setupTabBarController() {
        tabBarController.viewControllers = self.childCoordinators.map { $0.navigationController }
        tabBarController.tabBar.barTintColor = Asset.Colors.black.color
        tabBarController.tabBar.tintColor = Asset.Colors.white.color
    }

    private func createChildCoordinators() {
        createShowsCoordinator()
        createFavoriteCoordinator()
        createSettingsCoordinator()
    }

    private func createShowsCoordinator() {
        let showsCoordinator = ShowsCoordinator(navigationController: UINavigationController())
        showsCoordinator.start()
        childCoordinators.append(showsCoordinator)
    }

    private func createFavoriteCoordinator() {
        let favoriteCoordinator = FavoriteCoordinator(navigationController: UINavigationController())
        favoriteCoordinator.start()
        childCoordinators.append(favoriteCoordinator)
    }

    private func createSettingsCoordinator() {
        let settingsCoordinator = SettingsCoordinator(navigationController: UINavigationController())
        settingsCoordinator.start()
        childCoordinators.append(settingsCoordinator)
    }
}
