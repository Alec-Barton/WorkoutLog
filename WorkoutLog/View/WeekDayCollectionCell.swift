//
//  WeekDayCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 5/25/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation
import UIKit

class WeekdayCell: UICollectionViewCell {
    static let id = "WeekDayCellId"
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public var day: WeekdayName? {
        didSet{
            guard let day = day else { return }
            label.text = "\(day)".capitalized
        }
    }

    func setup () {
        self.backgroundColor = .white
        
        self.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.widthAnchor.constraint(equalTo: self.widthAnchor),
            label.heightAnchor.constraint(equalTo: self.heightAnchor),
        ])
    }

    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
}
