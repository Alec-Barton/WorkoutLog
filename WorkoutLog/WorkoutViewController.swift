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
        
        workoutTableView.register(WorkoutCell.self, forCellReuseIdentifier: WorkoutCell.id)
        workoutTableView.dataSource = self
        workoutTableView.delegate = self
        
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
            workoutTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95),
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
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return day?.workouts.count ?? 0 + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutCell.id, for: indexPath) as! WorkoutCell
        cell.workout = day?.workouts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000.0
    }
}
