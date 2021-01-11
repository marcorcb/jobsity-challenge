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

    }
}
