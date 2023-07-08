//
//  FindCoordinator.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import XCoordinator
import UIKit

enum FindRoute: Route {
    case find
}

class FindCoordinator: NavigationCoordinator<FindRoute> {
    init() {
        super.init(initialRoute: .find)
    }
    
    override func prepareTransition(for route: FindRoute) -> NavigationTransition {
        switch route {
            
        case .find:
            let viewController = UIViewController()
            viewController.view.backgroundColor = .gray
            return .push(viewController)
        }
    }
}
