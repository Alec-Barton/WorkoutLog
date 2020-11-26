//
//  WeekTableCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 11/22/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class WeekTableCell: UITableViewCell {
    
    static let id = "WeekCellId"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    convenience init() {
        self.init(style: .default ,reuseIdentifier: WeekTableCell.id)
        
        setup()
    }
    
    private func setup() {
        
    }

    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
}
