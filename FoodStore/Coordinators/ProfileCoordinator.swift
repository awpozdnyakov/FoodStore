//
//  ProfileCoordinator.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import XCoordinator
import UIKit

enum ProfileRoute: Route {
    case profile
}

class ProfileCoordinator: NavigationCoordinator<ProfileRoute> {
    init() {
        super.init(initialRoute: .profile)
    }
    
    override func prepareTransition(for route: ProfileRoute) -> NavigationTransition {
        switch route {
            
        case .profile:
            let viewController = UIViewController()
            viewController.view.backgroundColor = Asset.Colors.surface.color
            return .push(viewController)
        }
    }
}

