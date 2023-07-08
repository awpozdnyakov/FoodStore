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
        NavigationView{
            VStack(spacing: 0) {
                CategoriesView(сategories: viewModel.сategories, action: {})
            }
            .onAppear(perform: viewModel.loadCategorys)
            .padding(.all, 15)
            Spacer()
        }
        .navigationBarItems(leading: NavigationItemView(), trailing: Image(uiImage: Asset.Images.avatar.image))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(viewModel: HomeViewModel(router: .previewMock()))
    }
}
