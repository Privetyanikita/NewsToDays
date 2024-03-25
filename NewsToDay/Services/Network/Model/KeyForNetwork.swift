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
    static let business = "category=business"
    static let entertainment = "category=entertainment"
    static let general = "category=general"
    static let health = "category=health"
    static let science = "category=science"
    static let sports = "category=sports"
    static let technology = "category=technology"
}
