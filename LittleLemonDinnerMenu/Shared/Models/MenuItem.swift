//
//  MenuItem.swift
//  LittleLemonDinnerMenu
//
//  Created by Hamza Chaouki on 2/12/2023.
//

import Foundation

protocol MenuItemProtocol {
    var id: UUID { get }
    var title: String { get }
    var price: Double { get set }
    var image: String { get }
    var ordersCount: Int { get set }
    var ingredients: [Ingredient] { get set }
    var menuCategory: MenuCategory { get }
    var popularity: Int { get }
}

struct MenuItem: MenuItemProtocol, Identifiable, Equatable {
    let id: UUID
    var title: String
    var price: Double
    var image: String
    var ordersCount: Int
    var ingredients: [Ingredient]
    var menuCategory: MenuCategory
    var popularity: Int

    init(title: String, menuCategory: MenuCategory, price: Double, image: String,ordersCount: Int, ingredients: [Ingredient] = [], popularity: Int) {
        self.id = UUID()
        self.title = title
        self.menuCategory = menuCategory
        self.price = price
        self.image = image
        self.ordersCount = ordersCount
        self.ingredients = ingredients
        self.popularity = popularity
    }
    
    static func == (lhs: MenuItem, rhs: MenuItem) -> Bool {
           return lhs.id == rhs.id
    }
}
