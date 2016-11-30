//
//  UIColor+AppColors.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 11/30/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import UIKit

extension UIColor {

    enum AppColors {
        static let raizlabsRed = UIColor.color(fromHex: 0xec594d, alpha: 1.0)
    }

    /// Generate UIColor from Hex. Adapted from http://stackoverflow.com/a/24196572/4092717
    ///
    /// - Parameters:
    ///   - hex: Int (change # to 0x)
    ///   - alpha: Double (0 transparent, 1 solid)
    /// - Returns: UIColor
    class func color(fromHex hex: Int, alpha: Double = 1.0) -> UIColor {
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0xFF00) >> 8) / 255.0
        let blue = Double((hex & 0xFF)) / 255.0
        return UIColor( red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha:CGFloat(alpha) )
    }
}
