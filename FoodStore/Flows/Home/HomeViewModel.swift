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
    private let service: CategoriesService
    private var cancellable: AnyCancellable?
    
    init(
        router: UnownedRouter<HomeRoute>,
        service: CategoriesService = CategoriesServiceImpl()
    ) {
        self.router = router
        self.service = service
    }
    
    func loadCategorys() {
        cancellable = service.getCategories()
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] сategories in
                guard let self else { return }
                self.сategories = сategories.сategories
                self.objectWillChange.send()
                print(сategories)
            }
    }
}
