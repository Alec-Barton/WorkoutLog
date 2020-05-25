//
//  DayCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 5/20/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation
import UIKit

class DayCell: UICollectionViewCell {
    
    static let id = "DayCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    func setup () {

    }

    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
}
