//
//  Font.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import UIKit

enum Font: String {
    case bold = "Inter-Bold"
    case medium = "Inter-Medium"
    case regular = "Inter-Regular"
    case semibold = "Inter-SemiBold"
    
    static func getFont(_ font: Font, size: CGFloat) -> UIFont {
        return UIFont(name: font.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
