//
//  DayTitleView.swift
//  WorkoutLog
//
//  Created by Alec Barton on 12/23/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class DayTitleView: UIView {
    
    //var delegate: DayTitleViewDelegate?
    //var date: Date?
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "June 25th 2020"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var weekdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Wednesday"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var previousButton: UIButton = {
        let button = UIButton()
        button.setTitle("<", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle(">", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        addSubview(dateLabel)
        addSubview(weekdayLabel)
        addSubview(previousButton)
        addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            previousButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            previousButton.widthAnchor.constraint(equalToConstant: 30.0),
            previousButton.heightAnchor.constraint(equalToConstant: 30.0),
            previousButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            nextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
            nextButton.widthAnchor.constraint(equalToConstant: 30.0),
            nextButton.heightAnchor.constraint(equalToConstant: 30.0),
            nextButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            dateLabel.leadingAnchor.constraint(equalTo: previousButton.trailingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor),
            dateLabel.topAnchor.constraint(equalTo: self.topAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            
            weekdayLabel.leadingAnchor.constraint(equalTo: previousButton.trailingAnchor),
            weekdayLabel.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor),
            weekdayLabel.topAnchor.constraint(equalTo: self.centerYAnchor),
            weekdayLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

