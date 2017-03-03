//
//  AppFont.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 12/1/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import UIKit

/// All fonts in the app should be specified here.
enum AppFont {

    static func helvetica(_ size: CGFloat) -> UIFont {
        return font(name: "helvetica", size: size)
    }

    private static func font(name: String, size: CGFloat) -> UIFont {
        if let font = UIFont(name: name, size: size) {
            return font
        } else {
            print("Error loading font named \(name), returning system font")
            return UIFont.systemFont(ofSize: size)
        }
    }
}
