//
//  UIColor.swift
//  Series
//
//  Created by Francisco Depascuali on 17/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import UIKit

extension UIColor {
    /**
     Initialzer based on hex string.

     - parameter hexString: It can either be uppercase or lowercase, and contain or not a leading #.
     */
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat

        let start: String.Index
        if hexString.hasPrefix("#") {
            start = hexString.characters.index(hexString.startIndex, offsetBy: 1)
        } else {
            start = hexString.startIndex
        }

        var hexColor = hexString.substring(from: start)

        if hexColor.characters.count == 6 {
            hexColor.append("ff")
        }

        if hexColor.characters.count == 8 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0

            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xFF00_0000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00FF_0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000_FF00) >> 8) / 255
                a = CGFloat(hexNumber & 0x0000_00FF) / 255

                self.init(red: r, green: g, blue: b, alpha: a)
                return
            }
        }
        return nil
    }

    func toHex(alpha: Bool = false) -> String? {
        guard let components = cgColor.components, components.count >= 3 else {
            return nil
        }

        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)

        if components.count >= 4 {
            a = Float(components[3])
        }

        if alpha {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
}
