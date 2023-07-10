//
//  HomeCoordinator.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import XCoordinator
import UIKit
import SwiftUI

enum HomeRoute: Route {
    case home
    case category(String)
}

class HomeCoordinator: NavigationCoordinator<HomeRoute> {
    init() {
        super.init(initialRoute: .home)
    }
    
    override func prepareTransition(for route: HomeRoute) -> NavigationTransition {
        switch route {
            
        case .home:
            return .push(buildHomeScreen())
            
        case .category(let category):
            return .push(buildCategoryScreen(category: category))
        }
    }
    
    // MARK: - Build Screens
    
    private func buildHomeScreen() -> UIViewController {
        let viewModel = HomeViewModel(router: unownedRouter)
        let rootView = HomeScreenView(viewModel: viewModel)
        return UIHostingController(rootView: rootView)
    }
    
    private func buildCategoryScreen(category: String) -> UIViewController {
        let viewModel = CategoryViewModel(category: category, router: unownedRouter)
        let rootView = CategoryScreenView(viewModel: viewModel)
        return UIHostingController(rootView: rootView)
    }
}

