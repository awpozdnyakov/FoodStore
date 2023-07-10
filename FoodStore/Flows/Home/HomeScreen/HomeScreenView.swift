//
//  HomeScreenView.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import SwiftUI

struct HomeScreenView: View {
    
    @ObservedObject private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                CategoriesView(categories: viewModel.сategories, action: { category in
                    viewModel.showCategory(category: category.name )
                })
                Spacer()
            }
            .padding(.all, 15)
            .onAppear(perform: viewModel.loadCategorys)
        }
        .navigationBarItems(leading: NavigationItemView(), trailing: Image(uiImage: Asset.Images.avatar.image))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(viewModel: HomeViewModel(router: .previewMock()))
    }
}
