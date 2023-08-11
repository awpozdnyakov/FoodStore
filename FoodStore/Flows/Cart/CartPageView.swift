//
//  CartPageView.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 16.07.2023.
//

import SwiftUI

struct CartPageView: View {
    
    @Binding var cartItems: [CartItem]
    private let addOne: (CartItem) -> Void
    private let deleteOne: (CartItem) -> Void
    
    init(
        cartItems: Binding<[CartItem]>,
        addOne: @escaping (CartItem) -> Void,
        deleteOne: @escaping (CartItem) -> Void
    ) {
        self._cartItems = cartItems
        self.addOne = addOne
        self.deleteOne = deleteOne
    }
    
    var body: some View {
        if !($cartItems.isEmpty) {
            ScrollView{
                LazyVStack(spacing: 16) {
                    ForEach(cartItems) { item in
                        CartItemView(cartItem: item,
                                     addOne: { addOne(item) },
                                     deleteOne: { deleteOne(item) })
                    }
                }
            }
        } else {
            Text("Корзина пуста")
        }
    }
}
