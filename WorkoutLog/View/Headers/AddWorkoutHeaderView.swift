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

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle( " +  Add New Workout", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24.0)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        button.layer.borderColor = ColorTheme.lightGray4.cgColor
//        button.layer.borderWidth = 1.0
//        button.layer.cornerRadius = 5.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = " +  Add New Workout"
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
        self.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped(_ sender: Any) {
        print("Tapped Add Workout Button")
    }
}

