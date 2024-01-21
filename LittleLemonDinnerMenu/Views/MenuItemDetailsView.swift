//
//  MenuItemDetailsView.swift
//  LittleLemonDinnerMenu
//
//  Created by Hamza Chaouki on 1/12/2023.
//

import SwiftUI

struct MenuItemDetailsView: View {
    let item: MenuItem

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Image(item.image) // Display the image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                
                Text("Price: $\(item.price, specifier: "%.2f")")
                    .font(.subheadline)

                Text("Ordered: \(item.ordersCount) times")
                    .font(.subheadline)

                Text("Ingredients: \(item.ingredients.map { $0.rawValue }.joined(separator: ", "))")
                    .font(.subheadline)
            }
            .padding()
        }
        .navigationTitle(item.title)
    }
}

#Preview {
    MenuItemDetailsView(item: MockData.foodMenuItems[0])
}
