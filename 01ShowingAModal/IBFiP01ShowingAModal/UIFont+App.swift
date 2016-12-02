//
//  UIFont+App.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 12/1/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import UIKit

extension UIFont {

    /// Font types for the app, all fonts used in the app should be listed here
    enum AppFontType: String {
        case helvetica
    }

    /// Generate a font type for the app given a size
    ///
    /// - Parameters:
    ///   - type: enum AppFontType
    ///   - size: CGFloat
    /// - Returns
    static func App(type: AppFontType, ofSize size: CGFloat) -> UIFont {
        if let font = UIFont(name: type.rawValue, size: size) {
            return font
        } else {
            print("Error loading font named: \(type.rawValue), returning system font")
            return UIFont.systemFont(ofSize: size)
        }
    }
    
}
