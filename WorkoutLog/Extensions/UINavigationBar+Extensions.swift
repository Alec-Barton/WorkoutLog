//
//  UINavigationBar+Extensions.swift
//  WorkoutLog
//
//  Created by Alec Barton on 9/6/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

extension UINavigationBar {
    class func setVisibility(_ isVisible: Bool) {
        if !isVisible {
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
            UINavigationBar.appearance().shadowImage = UIImage()
            UINavigationBar.appearance().backgroundColor = .clear
            UINavigationBar.appearance().isTranslucent = true
        } else {
            UINavigationBar.appearance().setBackgroundImage(nil, for: .default)
            UINavigationBar.appearance().shadowImage = nil
            UINavigationBar.appearance().isTranslucent = false
        }
    }
}
