//
//  CategoriesModel.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import Foundation

//MARK: - MockData

enum CategoriesMockData {
    
    static let sportsCategory = "💰 Business"
    static let politicsCategory = "⛷️ Entertainment"
    static let lifeCategory = "🌐 General"
    static let gamingCategory = "🇨🇭 Health"
    static let animalsCategory = "🔮 Science"
    static let natureCategory = "⚽ Sports"
    static let foodCategory = "💻 Technology"
//    static let artCategory = "🎨 Art"
//    static let historyCategory = "📜 History"
//    static let fashionCategory = "👗 Fashion"
//    static let covid19Category = "😷 Covid-19"
//    static let middleEastCategory = "⚔️ Middle East"
}


//MARK: - Model

struct CategoriesModel {
    let title: String
}
