//
//  CartViewModel.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 10.07.2023.
//

import XCoordinator
import Foundation

final class CartViewModel: ObservableObject {
    
    static let shared = CartViewModel(router: .previewMock())
    
    @Published var cartItems: [CartItem] = []
    @Published var cartItem: CartItem?
    
    private let router: UnownedRouter<CartRoute>
    
    var cost: Int {
        var sum = 0
        for item in cartItems {
            sum += item.cost
        }
        return sum
    }
    
    init(
        router: UnownedRouter<CartRoute>
    ) {
        self.router = router
    }
    
    func addToCart(_ item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            cartItems[index].count += item.count
        } else {
            cartItems.append(item)
        }
    }
    
    func removeFromCart(_ item: CartItem) {
        cartItems.removeAll(where: { $0.id == item.id })
    }
}
