//
//  NewsToDay.swift
//  Network
//
//  Created by Kaspi on 19.03.2024.
//

import Foundation

class JsonDecoderHelper {
    static let jsonDecodeHelper = JsonDecoderHelper()
    private var jsonDecoder = JSONDecoder()
    
    func decode<T:Codable>(data: Data?, type: T.Type)->T? {
        if let data = data {
            return try? jsonDecoder.decode(type, from: data)
        }
        return nil
    }
}

