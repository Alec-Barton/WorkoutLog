//
//  WeekTableCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 11/22/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class WeekCollectionCell: UICollectionViewCell {
    
    static let id = "WeekCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private lazy var weekdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setup() {
        self.addSubview(weekdayLabel)
        self.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
        
        ])
        
        self.layer.cornerRadius = 4.0
    }

    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
}
