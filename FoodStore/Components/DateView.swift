//
//  DateView.swift
//  FoodStore
//
//  Created by Andrey Pozdnyakov on 08.07.2023.
//

import SwiftUI

struct DateView: View {
    
    private var date: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM, yyyy"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
    }
    
    private var formattedMonth: String {
        let formattedDate = date.string(from: Date())
        return formattedDate.localizedCapitalized
    }
    
    var body: some View {
        Text(formattedMonth)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(Asset.Colors.gray.swiftUIColor)
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}
