//
//  NotworkLayer.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 23.03.24.
//

import Foundation

class NewsService {
    
    private func fetchNewsData(from urlString: String, completion: @escaping (Result<[News], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "NewsServiceError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "NewsServiceError", code: 1, userInfo: [NSLocalizedDescriptionKey: "No data returned from URLSession"])))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let newsResponse = try decoder.decode(NewsResponse.self, from: data)
                if let articles = newsResponse.articles {
                    completion(.success(articles))
                } else {
                    completion(.failure(NSError(domain: "NewsServiceError", code: 2, userInfo: [NSLocalizedDescriptionKey: "No articles found in the response"])))
                }
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func fetchNews(forCategory category: String, completion: @escaping (Result<[News], Error>) -> Void) {
        let urlString = "\(Endpoints.baseUrl)\(Endpoints.topHeadlines)\(Endpoints.language)&category=\(category)&apiKey=\(Endpoints.apiKey)"
        fetchNewsData(from: urlString, completion: completion)
    }
    
    func searchNews(query: String, limitRequest: Int, completion: @escaping (Result<[News], Error>) -> Void) {
        let urlString = "\(Endpoints.baseUrl)\(Endpoints.everything)\(Endpoints.language)&q=\(query)&pageSize=\(limitRequest)&apiKey=\(Endpoints.apiKey)"
        fetchNewsData(from: urlString, completion: completion)
    }
    
    func fetchNewNews(limitRequest: Int, completion: @escaping (Result<[News], Error>) -> Void) {
        let urlString = "\(Endpoints.baseUrl)\(Endpoints.topHeadlines)\(Endpoints.language)&sort=popularity&pageSize=\(limitRequest)&apiKey=\(Endpoints.apiKey)"
        fetchNewsData(from: urlString, completion: completion)
    }
}
