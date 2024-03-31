//
//  Model.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 26.03.24.
//

import Foundation

struct NewsModelDatabase{
    let author: String?
    let title: String?
    let description: String?
    var url: String?
    let urlToImage: String?
    let content: String?
    
    //MARK: - Init
    init?(dictionary: [String: Any]) {
        guard let author = dictionary["author"] as? String?,
              let title = dictionary["title"] as? String?,
              let description = dictionary["description"] as? String?,
              let url = dictionary["url"] as? String?,
              let urlToImage = dictionary["urlToImage"] as? String?,
              let content = dictionary["content"] as? String? else {
            return nil
        }
        
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.content = content
    }
}

extension NewsModelDatabase {
    init(news: News) {
        self.author = news.author
        self.title = news.title
        self.description = news.description
        self.url = news.url
        self.urlToImage = news.urlToImage
        self.content = news.content
    }
}
