//
//  WorkoutViewController.swift
//  WorkoutLog
//
//  Created by Alec Barton on 5/25/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation
import UIKit

class WorkoutViewController: UIViewController {
    
    var workout: Workout?
    
    private lazy var tableView : UITableView = {
        let view = UITableView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "DATE"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var workoutLabel: UILabel = {
        let label = UILabel()
        label.text = "WORKOUT"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = .orange
//        let template = TemplateManager.shared.getTemplate(workoutNamed: "Chest Day")
        workout = Workout(named: "Chest Day")

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ExerciseCell.self, forCellReuseIdentifier: ExerciseCell.id)
        
        setup()
    }
    
    private func setup() {
        view.addSubview(dateLabel)
        view.addSubview(workoutLabel)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95),
            dateLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            workoutLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20.0),
            workoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            workoutLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95),
            workoutLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            tableView.topAnchor.constraint(equalTo: workoutLabel.bottomAnchor, constant: 50.0),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100.0),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

extension WorkoutViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("")
    }
}

extension WorkoutViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let workout = workout else { return 0 }
        return workout.exercises.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseCell.id, for: indexPath) as! ExerciseCell
        if let exercise = workout?.exercises[indexPath.row] {
            cell.exercise = Exercise(named: exercise.name)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //TODO: Clean up height calculation
//        guard let workout = workout else { return 0 }
//        guard workout.exercises.count - 1 >= indexPath.row else { return 0 }
        
//        return 60 + (workout.exercises.count/3) * 50
        return 150
    }
}
