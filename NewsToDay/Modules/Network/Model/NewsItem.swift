//
//  NewsItem.swift
//  Network
//
//  Created by lukoom on 19.03.2024.
//

import Foundation


struct NewsItem: Codable, Identifiable {
    var id = UUID().uuidString
    var url: String?
    var urlToImage: String?
    var author: String?
    var title: String?
    var content: String?
    var publishedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case title = "title"
        case content = "content"
        case publishedAt = "publishedAt"
        case url = "url"
        case urlToImage = "urlToImage"
    }
}
    struct NewList: Codable {
        var articles: [NewsItem] = [NewsItem]()
        enum CodingKeys: String, CodingKey {
            case articles = "articles"
        }
    }

