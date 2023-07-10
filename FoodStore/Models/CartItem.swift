//
//  CartItemModel.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 10.07.2023.
//

import Foundation

struct CartItem: Identifiable, Equatable {
    
    let id: String
    let dish: Dish
    var count: Int
    var cost: Int {
        return dish.price * self.count
    }
    
    static func == (lhs: CartItem, rhs: CartItem) -> Bool {
        return lhs.id == rhs.id &&
        lhs.dish == rhs.dish &&
        lhs.count == rhs.count
    }
}

extension Dish: Equatable {
    static func == (lhs: Dish, rhs: Dish) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.price == rhs.price &&
        lhs.weight == rhs.weight &&
        lhs.description == rhs.description &&
        lhs.imageUrl == rhs.imageUrl &&
        lhs.tegs == rhs.tegs
    }
}
