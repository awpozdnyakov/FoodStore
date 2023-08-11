//
//  CategoryScreenView.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import SwiftUI
import XCoordinator

struct CategoryScreenView: View {
    
    @ObservedObject private var viewModel: CategoryViewModel
    
    init(viewModel: CategoryViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack{
            NavigationStack {
                VStack {
                    buildTegsSection()
                    DishesView(dishes: viewModel.filteredDishes, showDetail: $viewModel.showDetail, selectedDish: $viewModel.selectedDish)
                }
                .padding(.all, 10)
                .onAppear(perform: viewModel.loadDishes)
            }
            .navigationBarBackButtonHidden()
            .navigationTitle(viewModel.category)
            .navigationBarItems(leading: BackButton())
            .navigationBarItems(trailing: Image(uiImage: Asset.Images.avatar.image))
            if viewModel.showDetail {
                DishDetailView(dish: $viewModel.selectedDish, showDetail: $viewModel.showDetail, action: {
                    viewModel.addItem(CartItem(id: $viewModel.selectedDish.id, dish: viewModel.selectedDish, count: 1))
                    viewModel.showDetail = false
                })
            }
        }
    }
    
    @ViewBuilder
    private func buildTegsSection() -> some View {
        HStack(spacing: 10) {
            ForEach(viewModel.tegs, id: \.self) { teg in
                Button(action: {
                    viewModel.selectTeg(teg)
                }) {
                    Text(teg)
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(viewModel.selectedTeg == teg ? .white : .black)
                        .padding(10)
                        .background(viewModel.selectedTeg == teg ? Color(asset: Asset.Colors.blue) : Color(asset: Asset.Colors.surface))
                        .cornerRadius(10)
                }
            }
        }
        .padding(.vertical, 10)
    }
}

struct CategoryScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScreenView(viewModel: CategoryViewModel(category: "", router: .previewMock()))
    }
}


