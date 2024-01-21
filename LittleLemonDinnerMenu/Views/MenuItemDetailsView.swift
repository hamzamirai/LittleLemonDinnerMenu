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
                
                HStack {
                    Text("Price: ")
                        .font(.headline)
                    Text("$\(item.price, specifier: "%.2f")")
                        .font(.subheadline)
                }

                HStack {
                    Text("Ordered: ")
                        .font(.headline)
                    
                    Text("\(item.ordersCount) times")
                        .font(.subheadline)
                }
                
                if !item.ingredients.isEmpty {
                    HStack {
                        Text("Ingredients: ")
                            .font(.headline)
                        Text("\(item.ingredients.map { $0.rawValue }.joined(separator: ", ")).")
                            .font(.subheadline)
                    }
                }

            }
            .padding()
        }
        .navigationTitle(item.title)
    }
}

#Preview {
    MenuItemDetailsView(item: MockData.foodMenuItems[0])
}
