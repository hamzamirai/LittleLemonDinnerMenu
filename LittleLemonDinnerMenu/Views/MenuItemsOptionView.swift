//
//  MenuItemsOptionView.swift
//  LittleLemonDinnerMenu
//
//  Created by Hamza Chaouki on 1/12/2023.
//

import SwiftUI

struct MenuItemsOptionView: View {
    @ObservedObject var viewModel: MenuViewViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("SELECTED CATEGORIES")) {
                    CheckableRow(title: "Food", isChecked: $viewModel.showFood, alwaysOneSelected: true, otherOptions: [$viewModel.showDrinks, $viewModel.showDesserts])
                    CheckableRow(title: "Drinks", isChecked: $viewModel.showDrinks, alwaysOneSelected: true, otherOptions: [$viewModel.showFood, $viewModel.showDesserts])
                    CheckableRow(title: "Desserts", isChecked: $viewModel.showDesserts, alwaysOneSelected: true, otherOptions: [$viewModel.showFood, $viewModel.showDrinks])
                }

                Section(header: Text("SORT BY")) {
                    ForEach(SortOption.allCases.filter { $0 != .none }, id: \.self) { sortOption in
                        CheckableRow(
                            title: sortOption.rawValue,
                            isChecked: Binding(
                                get: { viewModel.selectedSortOption == sortOption },
                                set: { isSelected in
                                    if isSelected {
                                        viewModel.selectedSortOption = sortOption
                                    } else if viewModel.selectedSortOption == sortOption {
                                        // If deselecting, set sort to .none
                                        viewModel.selectedSortOption = .none
                                    }
                                    viewModel.updateMenuItems()
                                }
                            ),
                            alwaysOneSelected: false,
                            otherOptions: viewModel.otherSortOptionsBindings(excluding: sortOption)
                        )
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Filter")
            .navigationBarItems(trailing: Button("Done") {
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                  //  viewModel.updateMenuItems()
                }
            })
        }
    }
}

struct CheckableRow: View {
    var title: String
    @Binding var isChecked: Bool
    var alwaysOneSelected: Bool
    var otherOptions: [Binding<Bool>]

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            if isChecked {
                Image(systemName: "checkmark")
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                if alwaysOneSelected {
                    let otherOptionsSelected = otherOptions.contains { $0.wrappedValue }
                    if !isChecked || otherOptionsSelected {
                        isChecked.toggle()
                    }
                } else {
                    isChecked.toggle()
                }
            }
        }
    }
}

#Preview {
    MenuItemsOptionView(viewModel: MenuViewViewModel())
}
