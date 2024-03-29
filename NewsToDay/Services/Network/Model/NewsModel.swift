//
//  NewsNet.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 23.03.24.
//

import Foundation

// MARK: - News
struct News: Codable {
    let source: Source?
    let author, title, description: String?
    let url: String?
    let urlToImage: String?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [News]?
}

