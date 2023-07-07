//
//  Helper.swift
//  PhinconAttendance
//
//  Created by Dimas Wisodewo on 07/07/23.
//

import UIKit

enum CustomFont {
    case Avenir
}

class Helper {
    
    static let shared = Helper()
    
    func getCustomFont(customFont: CustomFont, size: CGFloat, weight: UIFont.Weight) -> UIFont {
        
        var fontName = ""
        
        // Assign custom font name
        switch customFont {
        case .Avenir:
            fontName = "AvenirLTStd"
        }
        
        // Specify custom font name
        switch weight {
        case .bold:
            fontName += "-Black"
        case .medium:
            fontName += "-Book"
        case .regular:
            fallthrough
        default:
            fontName += "-Roman"
        }
              
        // Get custom font
        guard let font = UIFont(name: fontName, size: size) else {
            print("Failed to get custom font \(fontName) size \(size)")
            return UIFont.systemFont(ofSize: size, weight: weight)
        }
        
        return font
    }
}
