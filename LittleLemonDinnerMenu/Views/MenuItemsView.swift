//
//  MenuItemsView.swift
//  LittleLemonDinnerMenu
//
//  Created by Hamza Chaouki on 1/12/2023.
//

import SwiftUI

struct MenuItemsView: View {
    // ViewModel instance
    @StateObject var viewModel = MenuViewViewModel()
    
    // State to control sheet presentation
    @State private var isShowingOptionsSheet = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 0), count: 3)

                    ForEach(MenuCategory.allCases, id: \.self) { category in
                        if viewModel.shouldShowCategory(category) {
                            Text(category.rawValue)
                                .font(.headline)
                                .padding(.horizontal, 16)
                            LazyVGrid(columns: columns, spacing: 8) {
                                ForEach(viewModel.menuItems.filter { $0.menuCategory == category }) { item in
                                    NavigationLink(destination: MenuItemDetailsView(item: item)) {
                                        MenuItemView(item: item, viewModel: viewModel)
                                    }
                                    .accentColor(.black)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .navigationBarItems(trailing: NavigationLink(destination: MenuItemsOptionView(viewModel: viewModel)) {
                Image(systemName: "slider.horizontal.3")
            })
            .onAppear {
                viewModel.updateMenuItems() // Ensures menu items are updated when the view appears
            }
        }
    }
}

struct MenuItemView: View {
    let item: MenuItem
    @ObservedObject var viewModel: MenuViewViewModel  // Injected ViewModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
                    VStack {
                        Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .cornerRadius(8)
                            .overlay(
                                // Conditionally display a transparent overlay if a filter is applied
                                Rectangle()
                                    .foregroundColor(.black.opacity(viewModel.selectedSortOption == .none ? 0 : 0.4))
                                                   .cornerRadius(8)
                                           )
                        
                        Text(item.title)
                           .font(.system(size: 12))
                           .foregroundColor(.black)
                    }
                    .padding(.all, 0)
            
            // This will create the filter indicator view based on the selected sort option
            filterIndicatorView()
                .padding([.top, .leading], 8)
            
        }
    }
    
    @ViewBuilder
    private func filterIndicatorView() -> some View {
        switch viewModel.selectedSortOption {
        case .price: //, .priceDescending:
            Text(String(format: "$%.2f", item.price))
                .font(.caption)
                .bold()
                .padding(6)
                .background(Color.white)
                .foregroundColor(.blue)
                .clipShape(Rectangle())
                .cornerRadius(8)
        case .mostPopular:
            Text("#\(item.popularity)")
                .font(.caption)
                .bold()
                .padding(6)
                .background(Color.white)
                .foregroundColor(.green)
                .clipShape(Rectangle())
                .cornerRadius(8)
        case .alphabetical:
            // If you want to show the first letter of the title for alphabetical sorting
            Text(String(item.title.prefix(1)))
                .font(.caption)
                .bold()
                .padding(6)
                .background(Color.white)
                .foregroundColor(.red)
                .clipShape(Rectangle())
                .cornerRadius(8)
        case .none:
            EmptyView()  // If no sort option is selected, do not show the indicator
        }
    }
}


#Preview {
    MenuItemsView()
}
