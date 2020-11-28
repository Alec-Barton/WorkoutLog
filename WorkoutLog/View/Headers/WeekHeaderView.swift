//
//  WeekHeaderView.swift
//  WorkoutLog
//
//  Created by Alec Barton on 11/22/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class WeekHeaderView: UICollectionReusableView {
    
    static let id = "WeekHeaderId"

    private lazy var startDateLabel: UILabel = {
        let label = UILabel()
        label.text = "March 1st"
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir Next Condensed", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var endDateLabel: UILabel = {
        let label = UILabel()
        label.text = "March 8th"
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir Next Condensed", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.text = """
            Total Lifts: 205
            Total Miles: 365
            Total Run Time: 72:05
        """
        label.numberOfLines = 3
        label.font = UIFont(name: "Avenir Next Condensed", size: 12)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup (){
        self.addSubview(startDateLabel)
        self.addSubview(endDateLabel)
        self.addSubview(detailsLabel)
        
        NSLayoutConstraint.activate([
            startDateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30.0),
            startDateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            startDateLabel.widthAnchor.constraint(equalToConstant: 130),
            startDateLabel.heightAnchor.constraint(equalToConstant: 22.5),
            
            endDateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30.0),
            endDateLabel.topAnchor.constraint(equalTo: startDateLabel.bottomAnchor, constant: 5.0),
            endDateLabel.widthAnchor.constraint(equalToConstant: 130),
            endDateLabel.heightAnchor.constraint(equalToConstant: 22.5),
            
            detailsLabel.leadingAnchor.constraint(equalTo: startDateLabel.trailingAnchor, constant: 0.0),
            detailsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            detailsLabel.widthAnchor.constraint(equalToConstant: 200),
            detailsLabel.heightAnchor.constraint(equalToConstant: 50.0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
