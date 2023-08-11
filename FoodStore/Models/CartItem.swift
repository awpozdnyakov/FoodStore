//
//  CartItemModel.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 10.07.2023.
//

import Foundation

struct CartItem: Identifiable, Equatable {
    static func == (lhs: CartItem, rhs: CartItem) -> Bool {
            return lhs.id == rhs.id && lhs.dish == rhs.dish && lhs.count == rhs.count
        }
    
    
    let id: Dish.ID
    let dish: Dish
    var count: Int
    var cost: Int {
        return dish.price * self.count
    }
}
