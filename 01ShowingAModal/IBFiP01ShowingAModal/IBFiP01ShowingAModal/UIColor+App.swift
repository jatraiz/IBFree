//
//  UIColor+App.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 11/30/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import UIKit

extension UIColor {

    /// Colors specific to the app that are not stock colors
    enum App {
        static let raizlabsRed = UIColor.color(fromHex: 0xec594d)
    }

    /// Produce a semi transparent color by setting the color's alpha to 0.8
    var semiTransparent: UIColor {
        return self.withAlphaComponent(0.8)
    }

    /// Generate UIColor from Hex. Adapted from http://stackoverflow.com/a/3532264/4092717
    ///
    /// - Parameters:
    ///   - hex: Int (change # to 0x)
    ///   - alpha: Double, default = 1
    /// - Returns: UIColor
    public class func color(fromHex hex: Int, alpha: CGFloat = 1.0) -> UIColor {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255
        let green = CGFloat((hex & 0xFF00) >> 8) / 255
        let blue = CGFloat((hex & 0xFF)) / 255
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
