//
//  CategoriesView.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import Foundation
import SwiftUI

struct CategoriesView: View {
    
    private let сategories: [Category]
    private let action: () -> Void
    
    init(
        сategories: [Category],
        action: @escaping () -> Void
    ) {
        self.сategories = сategories
        self.action = action
    }
    
    var body: some View {
        TabView {
            LazyVStack(spacing: 10) {
                if !(сategories.isEmpty) {
                    ForEach(сategories) { cardData in
                        CategoryCardView(category: cardData, action: action)
                    }
                } else {
                    Text("Загрузка данных")
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}
