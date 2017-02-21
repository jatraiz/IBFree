//
//  AppFont.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 12/1/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import UIKit

/// All fonts in the app should be specified here. Fonts are accessed by specifying the font family and a size. For example: let font = AppFont.helvetica.size(16)
enum AppFont: String {
    
    case helvetica

    func size(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: self.rawValue, size: size) {
            return font
        } else {
            print("Error loading font named \(self.rawValue), returning system font")
            return UIFont.systemFont(ofSize: size)
        }
    }
}
