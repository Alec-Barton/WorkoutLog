//
//  UIColor+Extensions.swift
//  WorkoutLog
//
//  Created by Alec Barton on 7/5/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//
import UIKit

//TODO: Refactor this
struct ColorTheme {
//  static var lightGray: UIColor  { return UIColor(hex: "#f2f1f6") }
    static var lightGray1: UIColor  { return UIColor(hex: "#dadada") }
    static var lightGray2: UIColor  { return UIColor(hex: "#cdcdcd") }
    static var lightGray3: UIColor  { return UIColor(hex: "#c0c0c0") }
    static var lightGray4: UIColor  { return UIColor(hex: "#b4b4b4") }
    static var lightGray5: UIColor  { return UIColor(hex: "#a7a7a7") }
}

extension UIColor {
    //TODO: Improve this
    public convenience init(hex: String) {
        let r, g, b: CGFloat
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: 1.0)
                    return
                }
            }
        }
        self.init(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
