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
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var date: Int? {
        didSet {
            guard let date = date else { return }
            if date == 0 {
                dateLabel.text = ""

            } else {
                dateLabel.text = String(date)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    func setup () {
        self.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            dateLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            dateLabel.heightAnchor.constraint(equalTo: self.heightAnchor),
        ])
    }

    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
}
