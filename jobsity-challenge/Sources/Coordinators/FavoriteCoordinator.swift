//
//  FavoriteCoordinator.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 09/01/21.
//

import UIKit

class FavoriteCoordinator: Coordinator {

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
    }

    private func setupTabBarController() {
        let image = Asset.Images.iconStar.image.withTintColor(Asset.Colors.black.color,
                                                              renderingMode: .automatic)
        navigationController.tabBarItem = UITabBarItem(
            title: L10n.Favorites.title,
            image: image,
            selectedImage: image
        )
    }
}
