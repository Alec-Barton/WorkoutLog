//
//  AddExerciseCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 7/6/20.
//  Copyright © 2020 Alec Barton. All rights reserved.

import UIKit

class WorkoutFooterView: UIView {
    static let id = "ExerciseAddCellId"

    private var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var addImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "addIcon")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var workoutLabel: UILabel = {
        let label = UILabel()
        label.text = "Add Workout"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setup() {
        addSubview(footerView)
        footerView.addSubview(addImageView)
        footerView.addSubview(workoutLabel)

        NSLayoutConstraint.activate([
            footerView.topAnchor.constraint(equalTo: self.topAnchor),
            footerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30.0),
            footerView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            addImageView.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            addImageView.widthAnchor.constraint(equalToConstant: 25.0),
            addImageView.heightAnchor.constraint(equalToConstant: 25.0),
            addImageView.leadingAnchor.constraint(equalTo: footerView.leadingAnchor),
            addImageView.trailingAnchor.constraint(equalTo: workoutLabel.leadingAnchor, constant: 10.0),
            
            workoutLabel.topAnchor.constraint(equalTo: footerView.topAnchor),
            workoutLabel.bottomAnchor.constraint(equalTo: footerView.bottomAnchor),
            workoutLabel.trailingAnchor.constraint(equalTo: footerView.trailingAnchor),
            
        ])
    }
}

