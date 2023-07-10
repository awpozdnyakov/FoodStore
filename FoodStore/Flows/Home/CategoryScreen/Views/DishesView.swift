//
//  DishesView.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 09.07.2023.
//

import SwiftUI

struct DishesView: View {
    
    private let dishes: [Dish]
    @Binding var showDetail: Bool
    @Binding var selectedDish: Dish
    
    init(
        dishes: [Dish],
        showDetail: Binding<Bool>,
        selectedDish: Binding<Dish>
    ) {
        self.dishes = dishes
        self._showDetail = showDetail
        self._selectedDish = selectedDish
    }
    
    var body: some View {
        TabView {
            if !dishes.isEmpty {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 9) {
                        ForEach(dishes) { dish in
                            DishCardView(dish: dish, selectedDish: $selectedDish, showDetail: $showDetail)
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    .padding(.horizontal, 10)
                }
            } else {
                Text(L10n.loading)
                    .padding()
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
