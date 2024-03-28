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
    let url: String?
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
    
    //MARK: - Public Methods
    func transferToNews(news:NewsModelDatabase) -> News {
        return News(source: Source(id: "", name: ""), author: news.author, title: news.title, description: news.description, url: news.url, urlToImage: news.urlToImage, content: news.content)
    }
    
    func transferToNewsModelDatabase(news: News) -> NewsModelDatabase {
        return NewsModelDatabase(dictionary: transferToDictionary(news: news)) ?? NewsModelDatabase(dictionary: [:])!
    }
    
    //MARK: - Private Methods
    private func transferToDictionary(news: News) -> [String: Any] {
        var dictionary: [String: Any] = [:]
        dictionary["author"] = news.author
        dictionary["title"] = news.title
        dictionary["description"] = news.description
        dictionary["url"] = news.url
        dictionary["urlToImage"] = news.urlToImage
        dictionary["content"] = news.content
        return dictionary
    }
    
}
