//
//  Categories.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import Foundation

struct CategoriesModel: Decodable {
    let сategories: [Category]
}

struct Category: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: URL?
}
