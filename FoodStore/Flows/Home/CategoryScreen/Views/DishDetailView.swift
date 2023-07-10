//
//  DishDetailView.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 09.07.2023.
//

import SwiftUI

struct DishDetailView: View {
    
    @Binding var showDetail: Bool
    @Binding var dish: Dish
    let action: () -> Void
    
    init(
        dish: Binding<Dish>,
        showDetail: Binding<Bool>,
        action: @escaping () -> Void
    ) {
        self._dish = dish
        self._showDetail = showDetail
        self.action = action
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack {
                VStack {
                    if let imageUrl = dish.imageUrl {
                        
                        AsyncImage(url: imageUrl) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            Color(asset: Asset.Colors.surface)
                        }
                        .frame(width: 198, height: 204)
                    }
                }
                .frame(height: 232)
                .frame(maxWidth: .infinity)
                .background(Color(asset: Asset.Colors.surface))
                .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text(dish.name)
                        .font(.system(size: 16))
                    HStack {
                        Text(L10n.price(dish.price))
                        Text(L10n.weight(dish.weight))
                            .foregroundColor(.gray)
                    }
                    .font(.system(size: 14))
                    Text(dish.description)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.system(size: 14))
                        .opacity(0.65)
                }
                Button(action: action) {
                    Text(L10n.addToCart)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding(.all, 17)
            .background(.white)
            .cornerRadius(25)
            HStack{
                Button(action: {}) {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 22, height: 20)
                        .foregroundColor(.black)
                        .padding()
                        .background(.white)
                }
                .frame(width: 40, height: 40)
                .cornerRadius(10)
                Button(action: {
                    withAnimation {
                        showDetail.toggle()
                    }
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.black)
                        .padding()
                        .background(.white)
                }
                .frame(width: 40, height: 40)
                .cornerRadius(10)
            }
            .padding(.all, 25)
        }
        .padding(.all, 15)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.primary.opacity(0.35)
                .onTapGesture {
                    withAnimation{
                        showDetail.toggle()
                    }
                }
        )
        .ignoresSafeArea()
    }
}

struct DishDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DishDetailView(dish: .constant(Dish(id: 0, name: "Рыба с овощами и рисом", price: 799, weight: 560, description: "Рыба маринованная со специями, лимонным соком, соевым соусом и запечeнная в духовке с лучком, томатами и картошечкой под золотистой майонезно-сырной шубкой", imageUrl: nil, tegs: [])), showDetail: .constant(true), action: {})
    }
}
