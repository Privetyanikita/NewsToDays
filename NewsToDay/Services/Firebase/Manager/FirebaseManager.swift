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
