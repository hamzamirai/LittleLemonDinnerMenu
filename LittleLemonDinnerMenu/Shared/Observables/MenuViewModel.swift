//
//  MenuViewModel.swift
//  LittleLemonDinnerMenu
//
//  Created by Hamza Chaouki on 2/12/2023.
//

import SwiftUI

class MenuViewViewModel: ObservableObject {
    // MockData assumed to have static arrays of menu items for each category
    private let allFoodItems = MockData.foodMenuItems
    private let allDrinkItems = MockData.drinkMenuItems
    private let allDessertItems = MockData.dessertMenuItems
    
    @Published var menuItems: [MenuItem] = []
    
    // Filter options
    @Published var showFood: Bool = true
    @Published var showDrinks: Bool = true
    @Published var showDesserts: Bool = true
    @Published var selectedSortOption: SortOption = .none

    func shouldShowCategory(_ category: MenuCategory) -> Bool {
            switch category {
            case .food: return showFood
            case .drink: return showDrinks
            case .dessert: return showDesserts
            }
        }
    
    func otherSortOptionsBindings(excluding excludedOption: SortOption) -> [Binding<Bool>] {
           SortOption.allCases
               .filter { $0 != excludedOption }
               .map { sortOption in
                   .init(
                       get: { self.selectedSortOption == sortOption },
                       set: { isSelected in
                           if isSelected {
                               self.selectedSortOption = sortOption
                           }
                       }
                   )
               }
       }
    
    // Call this method to update the menu items based on the selected filters
    func updateMenuItems() {
            var combinedItems = [MenuItem]()
            if showFood {
                combinedItems += allFoodItems
            }
            if showDrinks {
                combinedItems += allDrinkItems
            }
            if showDesserts {
                combinedItems += allDessertItems
            }

        print("updateMenuItems: \(selectedSortOption)")
            // Apply sorting
            switch selectedSortOption {
            case .mostPopular:
                combinedItems.sort { $0.popularity > $1.popularity }
            case .price:
                combinedItems.sort { $0.price < $1.price }
            case .alphabetical:
                combinedItems.sort { $0.title < $1.title }
            case .none:
                break
            }

            // Assign sorted/combined items to published property
            menuItems = combinedItems
        
        // If no sort options are selected, set to none
               if !SortOption.allCases.contains(where: { $0 == selectedSortOption }) {
                   selectedSortOption = .none
               }
        }
    
    
    
    private func sortMenuItems() {
            switch selectedSortOption {
            case .none:
                // No specific sorting; show items as they are
                break
            case .mostPopular:
                // Sort based on a hypothetical 'popularity' attribute
                menuItems.sort { $0.popularity > $1.popularity }
            case .price:
                menuItems.sort { $0.price < $1.price }
            case .alphabetical:
                menuItems.sort { $0.title < $1.title }
            }
        }
}

enum MenuCategory: String, CaseIterable {
    case food = "Food"
    case drink = "Drink"
    case dessert = "Dessert"
}

enum SortOption: String, CaseIterable {
    case none = "None"
    case mostPopular = "Most Popular"
    case price = "Price $-$$$"
    case alphabetical = "A-Z"
}

enum Ingredient: String, CaseIterable {
    case spinach = "Spinach"
    case broccoli = "Broccoli"
    case carrot = "Carrot"
    case pasta = "Pasta"
    case tomatoSauce = "Tomato Sauce"
    case lemon = "Lemon"
    case sugar = "Sugar"
    case water = "Water"
    case mint = "Mint"
    case lime = "Lime"
    case sodaWater = "Soda Water"
    case ginger = "Ginger"
    case carbonatedWater = "Carbonated Water"
    case teaLeaves = "Tea Leaves"
    case mixedBerries = "Mixed Berries"
    case banana = "Banana"
    case yogurt = "Yogurt"
    case coffeeBeans = "Coffee Beans"
    case milk = "Milk"
    case herbalTeaLeaves = "Herbal Tea Leaves"
    case honey = "Honey"
    case flour = "Flour"
    case cocoa = "Cocoa"
    case eggs = "Eggs"
    case butter = "Butter"
    case melon = "Melon"
    case grapes = "Grapes"
    case apple = "Apple"
    case creamCheese = "Cream Cheese"
    case vanillaExtract = "Vanilla Extract"
    case cinnamon = "Cinnamon"
    case mascarpone = "Mascarpone"
    case ladyfingers = "Ladyfingers"
    case coffee = "Coffee"
    case iceCream = "Ice Cream"
    case chocolateSyrup = "Chocolate Syrup"
    case whippedCream = "Whipped Cream"
    case cherry = "Cherry"
    case lemonCurd = "Lemon Curd"
}
