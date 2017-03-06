//
//  AppColor.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 11/30/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import UIKit

/// All colors used in the app should be specified here
enum AppColor {
    static let clear = UIColor.clear
    static let lightGray = UIColor.lightGray
    static let raizlabsRed = AppColor.color(fromHex: 0xec594d)
    static let red = UIColor.red
    static let white = UIColor.white

    /// Generate UIColor from Hex. Adapted from Tom (http://stackoverflow.com/users/426478/tom) and Marcus Adam's (http://stackoverflow.com/users/168493/marcus-adams) Stack Overflow answer http://stackoverflow.com/a/3532264/4092717
    ///
    /// - Parameters:
    ///   - hex: Int (change # to 0x)
    ///   - alpha: Double, default = 1
    /// - Returns: UIColor
    private static func color(fromHex hex: Int, alpha: CGFloat = 1.0) -> UIColor {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255
        let green = CGFloat((hex & 0xFF00) >> 8) / 255
        let blue = CGFloat((hex & 0xFF)) / 255
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
