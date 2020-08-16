//
//  AddExerciseCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 7/6/20.
//  Copyright © 2020 Alec Barton. All rights reserved.

import UIKit

class ExerciseAddCell: UITableViewCell {
    static let id = "ExerciseAddCellId"

    private var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var addImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "addIcon")
        view.tintColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var workoutLabel: UILabel = {
        let label = UILabel()
        label.text = "Add New Workout"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }

    private func setup() {
        backgroundColor = ColorTheme.DayController.background

        addSubview(footerView)
        footerView.addSubview(addImageView)
        footerView.addSubview(workoutLabel)

        NSLayoutConstraint.activate([
            footerView.topAnchor.constraint(equalTo: self.topAnchor),
            footerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            footerView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            addImageView.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            addImageView.widthAnchor.constraint(equalToConstant: 20.0),
            addImageView.heightAnchor.constraint(equalToConstant: 20.0),
            addImageView.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 20.0),
            addImageView.trailingAnchor.constraint(equalTo: workoutLabel.leadingAnchor, constant: -30.0),
            
            workoutLabel.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 10),
            workoutLabel.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: -10),
            workoutLabel.heightAnchor.constraint(equalToConstant: 30.0),
            workoutLabel.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: 20.0),
            
        ])
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}





