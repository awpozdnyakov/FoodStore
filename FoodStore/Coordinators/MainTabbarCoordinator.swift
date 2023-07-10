//
//  MainTabbarCoordinator.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import XCoordinator
import UIKit

enum TabBarRoute: Route {
    case home
    case profile
}

class MainTabBarCoordinator: TabBarCoordinator<TabBarRoute> {
    private let homeRouter: StrongRouter<HomeRoute>
    private let findRouter: StrongRouter<FindRoute>
    private let cartRouter: StrongRouter<CartRoute>
    private let profileRouter: StrongRouter<ProfileRoute>
    
    convenience init() {
        UITabBar.appearance().tintColor = Asset.Colors.blue.color
        UITabBar.appearance().unselectedItemTintColor = Asset.Colors.gray.color
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.rootViewController.tabBarItem = UITabBarItem(title: L10n.home, image: Asset.Images.home.image, tag: 0)
        
        let findCoordinator = FindCoordinator()
        findCoordinator.rootViewController.tabBarItem = UITabBarItem(title: L10n.find, image: Asset.Images.find.image, tag: 1)
        
        let cartCorrdinator = CartCoordinator()
        cartCorrdinator.rootViewController.tabBarItem = UITabBarItem(title: L10n.cart, image: Asset.Images.cart.image, tag: 2)
        
        let profileCoordinator = ProfileCoordinator()
        profileCoordinator.rootViewController.tabBarItem = UITabBarItem(title: L10n.profile, image: Asset.Images.profile.image, tag: 3)
        
        self.init(
            homeRouter: homeCoordinator.strongRouter,
            findRouter: findCoordinator.strongRouter,
            cartRouter: cartCorrdinator.strongRouter,
            profileRouter: profileCoordinator.strongRouter
        )
    }
    
    init(
        homeRouter: StrongRouter<HomeRoute>,
        findRouter: StrongRouter<FindRoute>,
        cartRouter: StrongRouter<CartRoute>,
        profileRouter: StrongRouter<ProfileRoute>
    ) {
        self.homeRouter = homeRouter
        self.findRouter = findRouter
        self.cartRouter = cartRouter
        self.profileRouter = profileRouter
        super.init(tabs: [homeRouter, findRouter, cartRouter, profileRouter],select: homeRouter)
    }
}


