//
//  AddWorkoutHeaderView.swift
//  WorkoutLog
//
//  Created by Alec Barton on 12/24/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class AddWorkoutHeaderView: UICollectionReusableView {
    
    static let id = "AddWorkoutHeaderId"

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = " + Add New Workout"
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    
    private func setup (){
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

