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
        self.view.backgroundColor = .white
        workout = Workout(named: "Chest Day")
        
        //TODO: temp
        workout?.exercises[0].log(sets: [.weighted(10, 135), .weighted(8, 155)])
        workout?.exercises[1].log(sets: [.unweighted(100), .unweighted(50), .unweighted(100), .unweighted(100), .unweighted(50), .unweighted(100)])
        workout?.exercises[2].log(sets: [.interval(30), .interval(60), .interval(90)])
        
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
        cell.exercise = workout?.exercises[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //TODO: this is very jenky
        var exerciseSets = workout?.exercises[indexPath.row].sets.count ?? 0
        exerciseSets = exerciseSets == 0 ? 1 : exerciseSets
        let rows: Int = exerciseSets / 3
        let offset: Int = ((exerciseSets + 1) % 3 == 0) ? 1 : 0
        return CGFloat(60.0 + Double(rows + offset) * 50 )
    }
}
