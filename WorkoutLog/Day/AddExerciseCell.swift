//
//  AddExerciseCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 7/6/20.
//  Copyright © 2020 Alec Barton. All rights reserved.

import UIKit

class AddExerciseCell: UITableViewCell {
    static let id = "AddExerciseCellId"

    var workout: Workout?
    var editingIndex: Int?

    private lazy var workoutLabel: UILabel = {
        let label = UILabel()
        label.text = "WORKOUT"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white

        setup()
    }

    private func setup() {
        addSubview(workoutLabel)

        NSLayoutConstraint.activate([
            workoutLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20.0),
            workoutLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            workoutLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95),
            workoutLabel.heightAnchor.constraint(equalToConstant: 30.0),
        ])
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}





