//
//  CategoriesModel.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import Foundation

//MARK: - MockData

enum CategoriesMockData {
    
    static let sportsCategory = "🏈  Sports"
    static let politicsCategory = "⚖️  Politics"
    static let lifeCategory = "🌞  Life"
    static let gamingCategory = "🎮  Gaming"
    static let animalsCategory = "🐻  Animals"
    static let natureCategory = "🌴  Nature"
    static let foodCategory = "🍔  Food"
    static let artCategory = "🎨  Art"
    static let historyCategory = "📜  History"
    static let fashionCategory = "👗  Fashion"
    static let covid19Category = "😷  Covid-19"
    static let middleEastCategory = "⚔️  Middle East"
}


//MARK: - Model

struct CategoriesModel {
    let title: String
}
