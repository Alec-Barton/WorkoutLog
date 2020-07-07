//
//  UIColor+Extensions.swift
//  WorkoutLog
//
//  Created by Alec Barton on 7/5/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//
import UIKit

extension UIColor {
    struct WorkoutLog {
        static var lightGray: UIColor  { return UIColor(hex: "#f2f1f6") }
    }
}

extension UIColor {
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
