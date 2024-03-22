//
//  CustomError.swift
//  Network
//
//  Created by lukoom on 19.03.2024.
//

import Foundation

class CustomError: Error {
    var message: String
    
    init(message: String) {
        self.message = message
    }
}
