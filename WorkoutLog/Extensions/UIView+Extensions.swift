//
//  UIView+Extensions.swift
//  WorkoutLog
//
//  Created by Alec Barton on 8/4/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

extension UIView {

    var safeAreaTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return self.topAnchor
        }
    }
    
    var safeAreaBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return self.bottomAnchor
        }
    }
    
    var safeAreaLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.leadingAnchor
        } else {
            return self.leadingAnchor
        }
    }
    
    var safeAreaTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.trailingAnchor
        } else {
            return self.trailingAnchor
        }
    }
    
    var safeAreaWidthAnchor: NSLayoutDimension {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.widthAnchor
        } else {
            return self.widthAnchor
        }
    }
    
    var safeAreaHeightAnchor: NSLayoutDimension {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.heightAnchor
        } else {
            return self.heightAnchor
        }
    }
    
    var safeAreaCenterXAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.centerXAnchor
        } else {
            return self.centerXAnchor
        }
    }
    
    var safeAreaCenterYAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.centerYAnchor
        } else {
            return self.centerYAnchor
        }
    }
}

