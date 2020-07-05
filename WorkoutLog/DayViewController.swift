//
//  WorkoutViewController.swift
//  WorkoutLog
//
//  Created by Alec Barton on 5/25/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation
import UIKit

class DayViewController: UIViewController {
    
    var day: Day?
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "DATE"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var workoutTableView: UITableView = {
        let view = UITableView()
        view.allowsSelection = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        workoutTableView.register(ExerciseCell.self, forCellReuseIdentifier: ExerciseCell.id)

        workoutTableView.dataSource = self
        workoutTableView.delegate = self
        
        workoutTableView.rowHeight = UITableView.automaticDimension
        workoutTableView.estimatedRowHeight = 600
        
        setup()
        
        self.day = Day(date: Date())
        
        //TODO: temp
        if var workout = Workout(named: "Chest Day"), var workout2 = Workout(named: "Chest Day") {
            workout.test1()
            workout2.test2()
            day?.workouts.append(contentsOf: [workout, workout2])
            workoutTableView.reloadData()

        }
    }
    
    private func setup() {
        view.addSubview(dateLabel)
        view.addSubview(workoutTableView)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95),
            dateLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            workoutTableView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 50.0),
            workoutTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0),
            workoutTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20.0),
            workoutTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
}

extension DayViewController: UITableViewDelegate {
    //disabled
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("a")
    }
}

extension DayViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return day?.workouts.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return day?.workouts[section].exercises.count ?? 0 
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = WorkoutHeaderView()
        cell.title = "Workout #\(section)"
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return WorkoutHeaderView.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseCell.id, for: indexPath) as! ExerciseCell
        cell.exercise = day?.workouts[indexPath.section].exercises[indexPath.row]
        return cell
    }
}
