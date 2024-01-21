//
//  MenuItemTests.swift
//  LittleLemonDinnerMenuTests
//
//  Created by Hamza Chaouki on 3/12/2023.
//

import XCTest
@testable import LittleLemonDinnerMenu

class MenuItemTests: XCTestCase {

    func testMenuItemTitle() {
        // Given
        let title = "Pasta Primavera"
        
        // When
        let menuItem = MenuItem(title: title, menuCategory: .food, price: 12.95, image: "PastaPrimavera", ordersCount: 100, ingredients: [.pasta, .tomatoSauce], popularity: 80)
        
        // Then
        XCTAssertEqual(menuItem.title, title, "Initialized menu item title should match the value passed in.")
    }

    func testMenuItemIngredients() {
        // Given
        let ingredients: [Ingredient] = [.pasta, .tomatoSauce]
        
        // When
        let menuItem = MenuItem(title: "Spaghetti Bolognese", menuCategory: .food, price: 14.95, image: "SpaghettiBolognese", ordersCount: 150, ingredients: ingredients, popularity: 80)
        
        // Then
        XCTAssertEqual(menuItem.ingredients, ingredients, "Initialized menu item ingredients should match the values passed in.")
    }
}
