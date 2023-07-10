//
//  BackButtion.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 10.07.2023.
//

import SwiftUI

struct BackButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
        }
    }
}
