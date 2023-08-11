//
//  CartItemView.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 10.07.2023.
//

import SwiftUI

struct CartItemView: View {
    
    @Binding var cartItem: Binding<CartItem>
    private let addOne: () -> Void
    private let deleteOne: () -> Void
    
    init(
        cartItem: Binding<CartItem>,
        addOne: @escaping () -> Void,
        deleteOne: @escaping () -> Void
    ) {
        self.cartItem = cartItem
        self.addOne = addOne
        self.deleteOne = deleteOne
    }
    
    var body: some View {
        HStack(spacing: 10) {
            AsyncImage(url: cartItem.dish.imageUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color(asset: Asset.Colors.surface)
            }
            .frame(width: 65, height: 65)
            .cornerRadius(10)
            VStack(alignment: .leading, spacing: 5) {
                Text(cartItem.dish.name)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                HStack {
                    Text(L10n.price(cartItem.dish.price))
                    Text(L10n.weight(cartItem.dish.weight))
                        .foregroundColor(.gray)
                }
            }
            .font(.system(size: 14))
            Spacer()
            Button(action: {
                           addOne()
                       }) {
                           Image(systemName: "plus")
                       }
                       Button(action: {
                           deleteOne()
                       }) {
                           Image(systemName: "minus")
                       }
//            Stepper(
//                value: cartItem.count,
//                in: 1...10,
//                label: { Text("\(cartItem.count)")
//                        .padding(.leading, 30)
//                }
//            )
        }
        .padding(.all, 15)
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(cartItem: CartItem(id: 1, dish: Dish(id: 6, name: "Mash potato", price: 500, weight: 123, description: "", imageUrl: nil, tegs: []), count: 3), addOne: {}, deleteOne: {})
    }
}
