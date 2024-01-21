//
//  MockData.swift
//  LittleLemonDinnerMenu
//
//  Created by Hamza Chaouki on 3/12/2023.
//

import Foundation

struct MockData {
    static let foodMenuItems: [MenuItem] = [
        MenuItem(title: "Pasta Primavera", menuCategory: .food, price: 12.95, image: "PastaPrimavera", ordersCount: 120, ingredients: [.pasta, .tomatoSauce], popularity: 70),
        MenuItem(title: "Veggie Pizza", menuCategory: .food, price: 11.50, image: "VeggiePizza", ordersCount: 130, ingredients: [.tomatoSauce, .broccoli], popularity: 85),
        MenuItem(title: "Caesar Salad", menuCategory: .food, price: 9.99, image: "CaesarSalad", ordersCount: 110, ingredients: [.spinach], popularity: 60),
        MenuItem(title: "Grilled Cheese Sandwich", menuCategory: .food, price: 8.50, image: "GrilledCheeseSandwich", ordersCount: 90, ingredients: [], popularity: 50),
        MenuItem(title: "Vegan Burger", menuCategory: .food, price: 13.00, image: "VeganBurger", ordersCount: 140, ingredients: [.broccoli, .carrot], popularity: 75),
        MenuItem(title: "Spaghetti Bolognese", menuCategory: .food, price: 14.95, image: "SpaghettiBolognese", ordersCount: 150, ingredients: [.pasta, .tomatoSauce], popularity: 80),
        MenuItem(title: "Tomato Basil Soup", menuCategory: .food, price: 7.95, image: "TomatoBasilSoup", ordersCount: 100, ingredients: [], popularity: 65),
        MenuItem(title: "Stir Fry Vegetables", menuCategory: .food, price: 10.50, image: "StirFryVegetables", ordersCount: 115, ingredients: [.broccoli, .carrot], popularity: 70),
        MenuItem(title: "Margherita Pizza", menuCategory: .food, price: 12.00, image: "MargheritaPizza", ordersCount: 160, ingredients: [.tomatoSauce], popularity: 90),
        MenuItem(title: "Quinoa Salad", menuCategory: .food, price: 11.00, image: "QuinoaSalad", ordersCount: 85, ingredients: [.broccoli, .carrot], popularity: 55),
        MenuItem(title: "Vegetable Lasagna", menuCategory: .food, price: 13.50, image: "VegetableLasagna", ordersCount: 125, ingredients: [.pasta, .tomatoSauce], popularity: 78),
        MenuItem(title: "Roasted Vegetable Panini", menuCategory: .food, price: 9.50, image: "RoastedVegetablePanini", ordersCount: 95, ingredients: [.broccoli, .carrot], popularity: 65)
    ]

    static let drinkMenuItems: [MenuItem] = [
        MenuItem(title: "Lemonade", menuCategory: .drink, price: 3.50, image: "Lemonade", ordersCount: 150, ingredients: [.lemon, .sugar, .water], popularity: 80),
        MenuItem(title: "Mint Mojito", menuCategory: .drink, price: 4.50, image: "MintMojito", ordersCount: 135, ingredients: [.mint, .lime, .sugar, .sodaWater], popularity: 85),
        MenuItem(title: "Ginger Ale", menuCategory: .drink, price: 3.00, image: "GingerAle", ordersCount: 120, ingredients: [.ginger, .sugar, .carbonatedWater], popularity: 70),
        MenuItem(title: "Iced Tea", menuCategory: .drink, price: 2.50, image: "IcedTea", ordersCount: 140, ingredients: [.teaLeaves, .lemon, .sugar], popularity: 75),
        MenuItem(title: "Fruit Smoothie", menuCategory: .drink, price: 5.00, image: "FruitSmoothie", ordersCount: 160, ingredients: [.mixedBerries, .banana, .yogurt], popularity: 90),
        MenuItem(title: "Espresso", menuCategory: .drink, price: 2.75, image: "Espresso", ordersCount: 110, ingredients: [.coffeeBeans], popularity: 60),
        MenuItem(title: "Latte", menuCategory: .drink, price: 4.00, image: "Latte", ordersCount: 130, ingredients: [.coffeeBeans, .milk], popularity: 65),
        MenuItem(title: "Herbal Tea", menuCategory: .drink, price: 3.25, image: "HerbalTea", ordersCount: 100, ingredients: [.herbalTeaLeaves, .honey], popularity: 55)
    ]
    
    static let dessertMenuItems: [MenuItem] = [
        MenuItem(title: "Chocolate Cake", menuCategory: .dessert, price: 6.50, image: "ChocolateCake", ordersCount: 200, ingredients: [.flour, .cocoa, .sugar, .eggs, .butter], popularity: 95),
        MenuItem(title: "Fruit Salad", menuCategory: .dessert, price: 4.75, image: "FruitSalad", ordersCount: 110, ingredients: [.mixedBerries, .melon, .grapes, .apple], popularity: 70),
        MenuItem(title: "Cheesecake", menuCategory: .dessert, price: 6.00, image: "Cheesecake", ordersCount: 180, ingredients: [.creamCheese, .sugar, .eggs, .vanillaExtract], popularity: 88),
        MenuItem(title: "Ice Cream Sundae", menuCategory: .dessert, price: 5.00, image: "IceCreamSundae", ordersCount: 170, ingredients: [.iceCream, .chocolateSyrup, .whippedCream, .cherry], popularity: 90)
    ]
}


