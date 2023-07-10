//
//  CategoryViewModel.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 09.07.2023.
//

import Combine
import XCoordinator
import Moya
import Foundation

final class CategoryViewModel: ObservableObject {
    
    @Published var tegs: [String] = [L10n.tegOne, L10n.tegTwo, L10n.tegThree, L10n.tegFour]
    @Published var selectedTeg: String?
    @Published var dishes: [Dish] = []
    @Published var selectedDish: Dish = Dish(id: 1, name: "", price: 1, weight: 1, description: "", imageUrl: nil, tegs: [])
    @Published var showDetail = false
    
    private let router: UnownedRouter<HomeRoute>
    private let service: HomeService
    private var cancellable: AnyCancellable?
    
    var category: String
    var filteredDishes: [Dish] {
        if let selectedTeg = selectedTeg {
            return dishes.filter { dish in
                dish.tegs.contains(selectedTeg)
            }
        } else {
            return dishes
        }
    }
    
    init(
        category: String,
        router: UnownedRouter<HomeRoute>,
        service: HomeService = HomeServiceImpl()
    ) {
        self.category = category
        self.router = router
        self.service = service
    }
    
    // MARK: - Loading
    func loadDishes() {
        cancellable = service.getDishes()
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] dishes in
                guard let self = self else { return }
                self.dishes = dishes
                self.objectWillChange.send()
                print(dishes)
            }
    }
    
    // MARK: - Sorting
    func selectTeg(_ teg: String) {
        if selectedTeg == teg {
            selectedTeg = nil
        } else {
            selectedTeg = teg
        }
        self.objectWillChange.send()
    }
    
}
