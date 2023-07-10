//
//  CartCoordinator.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import XCoordinator
import UIKit
import SwiftUI

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
            return .push(buildCartScreen())
        }
    }
    
    private func buildCartScreen() -> UIViewController {
        let viewModel = CartViewModel(router: unownedRouter)
        let rootView = CartScreenView(viewModel: viewModel)
        return UIHostingController(rootView: rootView)
    }
}
