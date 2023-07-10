//
//  DishCardView.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 09.07.2023.
//

import SwiftUI

struct DishCardView: View {
    
    private let dish: Dish
    @Binding var selectedDish: Dish
    @Binding var showDetail: Bool
    
    
    init(
        dish: Dish,
        selectedDish: Binding<Dish>,
        showDetail: Binding<Bool>
    ) {
        self.dish = dish
        self._selectedDish = selectedDish
        self._showDetail = showDetail
    }
    
    var body: some View {
        VStack{
            VStack{
                AsyncImage(url: dish.imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color(asset: Asset.Colors.surface)
                }
                .frame(width: 79, height: 88)
            }
            .frame(width: 115, height: 115)
            .background(Color(asset: Asset.Colors.surface))
            .cornerRadius(10)
            Text(dish.name)
                .font(.system(size: 14))
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxHeight: 145)
        .onTapGesture {
            showDetail = true
            selectedDish = dish
        }
    }
}

struct dishCardView_Previews: PreviewProvider {
    static var previews: some View {
        DishCardView(dish: Dish(id: 1, name: "", price: 1, weight: 1, description: "", imageUrl: nil, tegs: []), selectedDish: .constant(Dish(id: 1, name: "", price: 1, weight: 1, description: "", imageUrl: nil, tegs: [])), showDetail: .constant(true))
    }
}
