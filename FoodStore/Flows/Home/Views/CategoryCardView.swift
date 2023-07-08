//
//  CategoryCardView.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import SwiftUI

struct CategoryCardView: View {
    
    private let category: Category
    private let action: () -> Void
    
    init(
        category: Category,
        action: @escaping () -> Void
    ) {
        self.category = category
        self.action = action
    }
    
    var body: some View {
            HStack {
                VStack {
                Text(category.name)
                    .font(.system(size: 20, weight: .regular))
                    .lineLimit(2)
                    .padding(.all, 15)
                Spacer()
            }
                Spacer()
                    }
            .frame(maxWidth: .infinity)
                        .frame(height: 148)
        .background(AsyncImage(url: category.imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color(.white)
                })
        .cornerRadius(15)
        .onTapGesture {
            action()
        }
    }
}

struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardView(
            category: Category(id: 1, name: "Название категории", imageUrl: nil),
            action: {})
    }
}

