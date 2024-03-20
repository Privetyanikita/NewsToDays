//
//  DI.swift
//  NewsToDay
//
//  Created by lukoom on 21.03.2024.
//

import Foundation

class DI {
    static let shared = DI()
    
    lazy var networkClient: NetworkClient = {
        return NetworkClient()
    }()
    
    lazy var newsServices: NewsServices = {
        return NewsServices(networkCLient: networkClient)
    }()
}
