//
//  KeyForNetwork.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 23.03.24.
//

import Foundation

enum Endpoints {
    static let apiKey = "2aee84cdae924d85bcb4ddeb6bf529e5"
//    static let apiKey = "2aee84cdae924d85bcb4ddeb6bf529e5"
//    static let apiKey = "140920362f47437e81a6e4ed634dca6c"
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
