//
//  CartItemView.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 10.07.2023.
//

import SwiftUI

struct CartItemView: View {
    
    @Binding var cartItem: CartItem
    
    init(
        cartItem: Binding<CartItem>
    ) {
        self._cartItem = cartItem
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
            Stepper(
                value: $cartItem.count,
                in: 1...10,
                label: { Text("\(cartItem.count)")
                        .padding(.leading, 30)
                }
            )
        }
        .padding(.all, 15)
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(cartItem: .constant(CartItem(id: "", dish: Dish(id: 1, name: "Рыба с овощами и рисом", price: 799, weight: 560, description: "", imageUrl: nil, tegs: []), count: 1)))
    }
}
