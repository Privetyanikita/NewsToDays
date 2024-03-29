//
//  BookmarkManager.swift
//  NewsToDay
//
//  Created by Иван Семенов on 25.03.2024.
//

import Foundation

class BookmarkManager {
    static let shared = BookmarkManager()
    
    private(set) var bookmarkedItems: [ListItem] = []
    
    private init() {}
    
    func addBookmark(_ news: ListItem) {
        bookmarkedItems.append(news)
    }
    
    func removeBookmark(at index: Int) {
        bookmarkedItems.remove(at: index)
    }
}
