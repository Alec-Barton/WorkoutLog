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
    
    //TODO: this is stupid and temporary
    var toggler:[Int:Bool] = [:]
    var editingIndex: IndexPath?
    
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
        self.view.backgroundColor = UIColor.WorkoutLog.lightGray
        workoutTableView.register(ExerciseCell.self, forCellReuseIdentifier: ExerciseCell.id)
        workoutTableView.register(ExerciseAddCell.self, forCellReuseIdentifier: ExerciseAddCell.id)

        workoutTableView.dataSource = self
        workoutTableView.delegate = self
        
        workoutTableView.rowHeight = UITableView.automaticDimension
        workoutTableView.estimatedRowHeight = 600
        
        setup()
        
        self.day = Day(date: Date())
        
        //TODO: temp
        if var workout = Workout(named: "Chest Day"), var workout2 = Workout(named: "Chest Day Jr.") {
            workout.test1()
            workout2.test2()
            day?.workouts.append(contentsOf: [workout, workout2])
            workoutTableView.reloadData()

        }
        guard let workouts = day?.workouts.count else { return }
        for i in 0..<workouts {
            toggler[i] = true
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}


extension DayViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return day?.workouts.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if toggler[section] ?? false {
            return (day?.workouts[section].exercises.count ?? 0) + 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = WorkoutHeaderView()
        view.workout = day?.workouts[section]
        view.section = section
        view.delegate = self
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return WorkoutHeaderView.height
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == (day?.workouts[indexPath.section].exercises.count ?? 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseAddCell.id, for: indexPath) as! ExerciseAddCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseCell.id, for: indexPath) as! ExerciseCell
        cell.exercise = day?.workouts[indexPath.section].exercises[indexPath.row]

        cell.index = indexPath
        cell.delegate = self
        if indexPath == editingIndex {
            cell.editorOpen = true
        }
        return cell
    }
}

extension DayViewController: WorkoutHeaderViewDelegate {
    func toggleOpen(_ view: WorkoutHeaderView) {
        guard let section = view.section else { return }
        guard let toggle = toggler[section] else { return }
        
        defer { workoutTableView.reloadSections(IndexSet(integer: section), with: .fade)}
        
        toggler[section] = !toggle
        
        guard toggle else { return }
        
        var indexPaths:[IndexPath] = []
        guard let workout = day?.workouts[section] else { return }
        for i in 0..<workout.exercises.count {
            indexPaths.append(IndexPath(row: i, section: section))
        }
        workoutTableView.deleteRows(at: indexPaths, with: .fade)
    }
}

extension DayViewController: ExerciseCellDelegate {
    func editingStateChanged(_ cell: ExerciseCell, editingIndex: IndexPath?) {
        self.workoutTableView.reloadData()
        self.editingIndex = editingIndex
    }
}
