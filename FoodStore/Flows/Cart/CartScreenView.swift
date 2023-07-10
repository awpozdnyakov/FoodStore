//
//  CartScreenView.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 10.07.2023.
//

import SwiftUI


struct CartScreenView: View {
    
    @ObservedObject private var viewModel: CartViewModel
    
    init(viewModel: CartViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(viewModel.cartItems) { item in
                    CartItemView(cartItem: $viewModel.cartItems[viewModel.cartItems.firstIndex(of: item)!])
                }
                .listStyle(.plain)
                ForEach(viewModel.cartItems) { item in
                    CartItemView(cartItem: $viewModel.cartItems[viewModel.cartItems.firstIndex(of: item)!])
                }
                Button(action: {}) {
                    Text(L10n.pay(viewModel.cost))
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 10)
            }
        }
        .navigationBarItems(leading: NavigationItemView(), trailing: Image(uiImage: Asset.Images.avatar.image))
    }
}

struct CartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CartScreenView(viewModel: CartViewModel(router: .previewMock()))
    }
}
