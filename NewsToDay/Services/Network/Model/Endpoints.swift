//
//  KeyForNetwork.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 23.03.24.
//

import Foundation

enum Endpoints {
    static let apiKey = "2443d28500d54fae81f82c6eef66ad15"
    static let baseUrl = "https://newsapi.org/v2/"
    static let country = "country=us"
    static let language = "language=en"
    static let topHeadlines = "top-headlines?"
    static let everything = "everything?"
    static let pageSize = "pageSize="
    static let query = "q="
    static let sort = "sortBy="
}

enum Categories {
    static let business = "business"
    static let entertainment = "entertainment"
    static let general = "general"
    static let health = "health"
    static let science = "science"
    static let sports = "sports"
    static let technology = "technology"
    static let gaming = "gaming"
}
