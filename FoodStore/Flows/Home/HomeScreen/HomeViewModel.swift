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
    
    @Published var сategories: [Category] = []
    
    private let router: UnownedRouter<HomeRoute>
    private let service: HomeService
    private var cancellable: AnyCancellable?
    
    init(
        router: UnownedRouter<HomeRoute>,
        service: HomeService = HomeServiceImpl()
    ) {
        self.router = router
        self.service = service
    }
    
    // MARK: - Loading
    func loadCategorys() {
        cancellable = service.getCategories()
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] сategories in
                guard let self else { return }
                self.сategories = сategories
                self.objectWillChange.send()
                print(сategories)
            }
    }
    
    // MARK: - Routing
    func showCategory(category: String) {
        router.trigger(.category(category))
    }
}
