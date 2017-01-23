//
//  AppFont.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 12/1/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import UIKit

/// All fonts in the app should be described here
enum AppFont: String {
    case helvetica

    func size(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: self.rawValue, size: size) {
            return font
        } else {
            print("Error loading font names \(self.rawValue), returning system font")
            return UIFont.systemFont(ofSize: size)
        }
    }
}
