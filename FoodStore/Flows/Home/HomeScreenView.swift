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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(viewModel: HomeViewModel(router: .previewMock()))
    }
}
