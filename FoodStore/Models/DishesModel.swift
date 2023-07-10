//
//  DishesModel.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 09.07.2023.
//

import Foundation

struct DishesModel: Decodable {
    let dishes: [Dish]
}

struct Dish: Decodable, Identifiable {
    let id: Int
    let name: String
    let price: Int
    let weight: Int
    let description: String
    let imageUrl: URL?
    let tegs: [String]
}

