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
        label.text = "Wednesday"
        label.textColor = ColorTheme.lightGray1
        label.font = UIFont(name: "Avenir Next Condensed", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "March 21st"
        label.textAlignment = .right
        label.textColor = ColorTheme.lightGray1
        label.font = UIFont(name: "Avenir Next Condensed", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //TODO: adjust colors
    //TODO: do we want "March 5th 2020" or "3/5/20" format here? Maybe the latter
    
    private func setup() {
        self.addSubview(weekdayLabel)
        self.addSubview(dateLabel)
        self.addSubview(dataView)
        
        NSLayoutConstraint.activate([
            weekdayLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0),
            weekdayLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor),
            weekdayLabel.topAnchor.constraint(equalTo: self.topAnchor),
            weekdayLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            dateLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5.0),
            dateLabel.topAnchor.constraint(equalTo: self.topAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            dataView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dataView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            dataView.topAnchor.constraint(equalTo: weekdayLabel.bottomAnchor),
            dataView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        self.layer.cornerRadius = 4.0
    }

    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
}
