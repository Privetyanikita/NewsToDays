//
//  FirebaseManager.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 26.03.24.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

class FirebaseManager{
    
    static let shared = FirebaseManager()
    
    private func configureFB() -> Firestore{
        var db:Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }
    
    func getPost(collection: String, nameDocument: String, completion: @escaping (Result<NewsModelDatabase, Error>) -> Void) {
        let db = configureFB()
        let docRef = db.collection(collection).document(nameDocument)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if let data = document.data() {
                    if let newsItem = NewsModelDatabase(dictionary: data) {
                        completion(.success(newsItem))
                    } else {
                        completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unable to parse NewsModelDatabase"])))
                    }
                }
            } else {
                completion(.failure(error ?? NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Document does not exist"])))
            }
        }
    }
    
    func isNewsExist(collection: String, title: String, completion: @escaping (Bool) -> Void) {
        let db = configureFB()
        let query = db.collection(collection).whereField("title", isEqualTo: title)
        
        query.getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(false)
            } else {
                if let snapshot = querySnapshot, !snapshot.isEmpty {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
    }
    
    func setPost(collection: String, nameDocument: String, data: [String: Any], completion: @escaping (Error?) -> Void) {
        let db = configureFB()
        db.collection(collection).document(nameDocument).setData(data) { error in
            completion(error)
        }
    }

    func deletePost(collection: String, nameDocument: String, completion: @escaping (Error?) -> Void) {
        let db = configureFB()
        db.collection(collection).document(nameDocument).delete { error in
            completion(error)
        }
    }
    
    func addBookmark(forUser user: User, bookmark: [String: Any], completion: @escaping (Error?) -> Void) {
        let db = configureFB()
        db.collection("users").document(user.uid).collection("bookmarks").addDocument(data: bookmark) { error in
            completion(error)
        }
    }
    
    func getBookmarks(forUser user: User, completion: @escaping (Result<[NewsModelDatabase], Error>) -> Void) {
        let db = configureFB()
        db.collection("users").document(user.uid).collection("bookmarks").getDocuments { (querySnapshot, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            var bookmarks = [NewsModelDatabase]()
            for document in querySnapshot!.documents {
                if let newsItem = NewsModelDatabase(dictionary: document.data()) {
                    bookmarks.append(newsItem)
                }
            }
            completion(.success(bookmarks))
        }
    }
    
    func deleteBookmark(forUser user: User, bookmarkId: String, completion: @escaping (Error?) -> Void) {
        let db = configureFB()
        db.collection("users").document(user.uid).collection("bookmarks").document(bookmarkId).delete { error in
            completion(error)
        }
    }
    
    func isNewsBookmarkedByUser(userId: String, newsUrl: String, completion: @escaping (Bool) -> Void) {
            let db = configureFB()
            let query = db.collection("users").document(userId).collection("bookmarks").whereField("url", isEqualTo: newsUrl)
            
            query.getDocuments { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    completion(false)
                } else {
                    if let snapshot = querySnapshot, !snapshot.isEmpty {
                        completion(true)
                    } else {
                        completion(false)
                    }
                }
            }
        }
}
