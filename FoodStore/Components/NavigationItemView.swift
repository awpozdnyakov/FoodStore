//
//  NavigationItemView.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import SwiftUI

struct NavigationItemView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(uiImage: Asset.Images.location.image)
            VStack(alignment: .leading) {
                Text(L10n.testTown)
                    .font(.system(size: 18, weight: .medium))
                DateView()
            }
        }
    }
}

struct NavigationItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationItemView()
    }
}
