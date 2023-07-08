//
//  HomeViewModel.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import Combine
import XCoordinator
import Moya
import Foundation

final class HomeViewModel: ObservableObject {
    
    
    private let router: UnownedRouter<HomeRoute>
    
    init(
        router: UnownedRouter<HomeRoute>
    ) {
        self.router = router
    }
}
