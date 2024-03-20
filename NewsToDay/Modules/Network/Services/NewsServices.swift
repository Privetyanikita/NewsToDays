//
//  NewsServices.swift
//  NewsToDay
//
//  Created by lukoom on 21.03.2024.
//

import Foundation

class NewsServices {
    private var networkCLient: NetworkClient
    
    init(networkCLient: NetworkClient) {
        self.networkCLient = networkCLient
    }
    
    func loadNews(completion: @escaping(Result<NewList?,Error>) -> Void) {
        self.networkCLient.request(path: "everything?q=science", parameters: [:], completion: completion)
        }
    }
