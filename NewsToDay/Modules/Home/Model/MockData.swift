//
//  MockData.swift
//  NewsToDay
//
//  Created by Иван Семенов on 20.03.2024.
//

import Foundation

struct MockData {
    
    static let shared = MockData()
    
    private let textField: ListSection = {
        .textField([.init(image: "", categories: "", newsTopic: "", news: "")])
    }()
    
    private let topics: ListSection = {
        .topics([.init(image: "", categories: "Random", newsTopic: "", news: ""),
                 .init(image: "", categories: "Business", newsTopic: "", news: ""),
                 .init(image: "", categories: "Science", newsTopic: "", news: ""),
                 .init(image: "", categories: "Technology", newsTopic: "", news: ""),
                 .init(image: "", categories: "Sports", newsTopic: "", news: ""),
                 .init(image: "", categories: "Gaming", newsTopic: "", news: ""),
                 .init(image: "", categories: "General", newsTopic: "", news: ""),
                 .init(image: "", categories: "Health", newsTopic: "", news: ""),
        ])
    }()

    private let news: ListSection = {
        .news([.init(image: "", categories: "", newsTopic: "", news: ""),
               .init(image: "", categories: "", newsTopic: "", news: ""),
               .init(image: "", categories: "", newsTopic: "", news: ""),
               .init(image: "", categories: "", newsTopic: "", news: ""),
               
        ])
    }()
    
    private let recommended: ListSection = {
        .recommended([.init(image: "", categories: "", newsTopic: "", news: ""),
                      .init(image: "", categories: "", newsTopic: "", news: ""),
                      .init(image: "", categories: "", newsTopic: "", news: ""),
                      .init(image: "", categories: "", newsTopic: "", news: ""),
        ])
    }()
    
    var pageData: [ListSection] {
        [textField, topics, news, recommended]
    }
}


 
