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
                 .init(image: "", categories: "Sports", newsTopic: "", news: ""),
                 .init(image: "", categories: "Gaming", newsTopic: "", news: ""),
                 .init(image: "", categories: "Politics", newsTopic: "", news: ""),
                 .init(image: "", categories: "Art", newsTopic: "", news: "")
        ])
    }()
    
    private let news: ListSection = {
        .news([.init(image: "Rectangle6", categories: "", newsTopic: "RANDOM", news: "A Simple Trick For Creating Color Palettes Quickly"),
               .init(image: "Rectangle6", categories: "", newsTopic: "ART", news: "Six steps to creating a color palette"),
               .init(image: "Rectangle6", categories: "", newsTopic: "COLORS", news: "Creating Color Palette from world around you"),
               .init(image: "Rectangle6", categories: "", newsTopic: "POLITICS", news: "The latest situation in the presidential election")
        ])
    }()
    
    private let recommended: ListSection = {
        .recommended([.init(image: "Rectangle7", categories: "", newsTopic: "UI/UX Design", news: "A Simple Trick For Creating Color Palettes Quickly"),
                      .init(image: "Rectangle7", categories: "", newsTopic: "Art", news: "Six steps to creating a color palette"),
                      .init(image: "Rectangle7", categories: "", newsTopic: "Colors", news: "Creating Color Palette from world around you"),
                      .init(image: "Rectangle7", categories: "", newsTopic: "Politics", news: "The latest situation in the presidential election")
        ])
    }()
    
    var pageData: [ListSection] {
        [textField, topics, news, recommended]
    }
}
