//
//  OnboardingModel.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import UIKit

//MARK: - MockData

enum OnboardingMockData {
    
    static let firstMainLabel = "First to know"
    static let secondMainLabel = "Lorem Ipsum"
    static let thirdMainLabel = "Excepteur sint occaecat"
    
    static let firstDescriptionlabel = "All news in one place, be first to know last news"
    static let secondDescriptionlabel = "Duis aute irure dolor in reprehenderit in voluptate velit"
    static let thirdDescriptionlabel = "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris"
    
    static let nextButton = "Next"
    static let getStartedButton = "Get Started"
}


//MARK: - Model

struct OnboardingModel {
    let mainImage: UIImage
}
