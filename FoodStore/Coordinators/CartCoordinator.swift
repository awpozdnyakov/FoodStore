//
//  CartCoordinator.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import XCoordinator
import UIKit

enum CartRoute: Route {
    case cart
}

class CartCoordinator: NavigationCoordinator<CartRoute> {
    init() {
        super.init(initialRoute: .cart)
    }
    
    override func prepareTransition(for route: CartRoute) -> NavigationTransition {
        switch route {
            
        case .cart:
            let viewController = UIViewController()
            viewController.view.backgroundColor = .gray
            return .push(viewController)
        }
    }
}
