//
//  FirebaseManager.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 26.03.24.
//

import Firebase

class FirebaseManager {
    
    static let shared = FirebaseManager() // Singleton instance
    
    private var databaseRef: DatabaseReference {
        return Database.database().reference()
    }
    
    private var currentUserID: String? {
        return Auth.auth().currentUser?.uid
    }
    
    // Добавление закладки в базу данных
    func addBookmark(news: NewsModelDatabase, completion: @escaping (Bool) -> Void) {
        guard let userID = currentUserID else {
            completion(false)
            return
        }
        
        let bookmarkRef = databaseRef.child("users").child(userID).child("bookmarks").childByAutoId()
        
        let bookmarkData: [String: Any?] = [
            "author": news.author,
            "title": news.title,
            "description": news.description,
            "url": news.url,
            "urlToImage": news.urlToImage,
            "content": news.content
        ]
        
        bookmarkRef.setValue(bookmarkData) { error, _ in
            completion(error == nil)
        }
    }
    
    // Удаление закладки из базы данных
    func removeBookmark(bookmarkID: String, completion: @escaping (Bool) -> Void) {
        guard let userID = currentUserID else {
            completion(false)
            return
        }
        
        let bookmarkRef = databaseRef.child("users").child(userID).child("bookmarks").child(bookmarkID)
        
        bookmarkRef.removeValue { error, _ in
            completion(error == nil)
        }
    }
    
    // Получение всех закладок текущего пользователя
    func fetchBookmarks(completion: @escaping ([NewsModelDatabase]?) -> Void) {
        guard let userID = currentUserID else {
            completion(nil)
            return
        }
        
        let bookmarksRef = databaseRef.child("users").child(userID).child("bookmarks")
        
        bookmarksRef.observeSingleEvent(of: .value) { snapshot in
            var bookmarks = [NewsModelDatabase]()
            
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let dict = snapshot.value as? [String: Any],
                   let bookmark = NewsModelDatabase(dictionary: dict) {
                    bookmarks.append(bookmark)
                }
            }
            
            completion(bookmarks)
        }
    }
    
    // Проверка, существует ли такая закладка в базе данных
    func bookmarkExists(withURL url: String, completion: @escaping (Bool) -> Void) {
        guard let userID = currentUserID else {
            completion(false)
            return
        }
        
        let bookmarksRef = databaseRef.child("users").child(userID).child("bookmarks")
        
        bookmarksRef.queryOrdered(byChild: "url").queryEqual(toValue: url).observeSingleEvent(of: .value) { snapshot in
            completion(snapshot.exists())
        }
    }
    
    func findBookmarkID(withURL url: String, completion: @escaping (String?) -> Void) {
        guard let userID = currentUserID else {
            completion(nil)
            return
        }
        
        let bookmarksRef = databaseRef.child("users").child(userID).child("bookmarks")
        
        bookmarksRef.queryOrdered(byChild: "url").queryEqual(toValue: url).observeSingleEvent(of: .value) { snapshot in
            guard let result = snapshot.children.allObjects.first as? DataSnapshot else {
                completion(nil)
                return
            }
            completion(result.key)
        }
    }
}
