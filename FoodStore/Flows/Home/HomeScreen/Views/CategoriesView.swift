//
//  CategoriesView.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import Foundation
import SwiftUI

struct CategoriesView: View {
    
    private let categories: [Category]
    private let action: (Category) -> Void
    
    init(
        categories: [Category],
        action: @escaping (Category) -> Void
    ) {
        self.categories = categories
        self.action = action
    }
    
    var body: some View {
        TabView {
            if !categories.isEmpty {
                LazyVStack(spacing: 10) {
                    ForEach(categories) { category in
                        CategoryCardView(category: category, action: {
                            self.action(category)
                        })
                    }
                }
            } else {
                Text(L10n.loading)
                    .padding()
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
